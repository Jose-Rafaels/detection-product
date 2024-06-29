import pymysql
from uuid import uuid4
from datetime import datetime
from helper.payment import create_transaction_midtrans 
from helper.enviroment import *

DB = pymysql.connect(
  host=database_host,
  user=database_user,
  password=database_password,
  database=database_name
)
def get_product():
    cur = DB.cursor()
    cur.execute("SELECT * FROM products")
    rv = cur.fetchall()
    return rv


# def insert_product(product):
#     cur = DB.cursor()
#     cur.execute("INSERT INTO products(product_id, name, price, stock) VALUES (%s, %s, %s, %s)", (str(uuid4()) ,product['name'], product['price'], product['stock']))
#     DB.commit()
#     cur.close()

def get_user_by_username(username):
    try:
        with DB.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT username, password FROM users WHERE username = %s"
            cursor.execute(sql, (username,))
            return cursor.fetchone()
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def add_user(username, hashed_password):
    try:
        with DB.cursor() as cursor:
            sql = "INSERT INTO users (username, password) VALUES (%s, %s)"
            cursor.execute(sql, (username, hashed_password))
            DB.commit()
    except pymysql.MySQLError as e:
        raise Exception(f"Database insert failed: {str(e)}")


def get_stock(product_id) :
    cur = DB.cursor()
    cur.execute("SELECT stock FROM products WHERE id=%s", (product_id,))
    rv = cur.fetchone()
    return rv

def decrement_stock(stock, product_id) :
    stock = get_stock(product_id)
    stock = stock - 1
    cur = DB.cursor()
    cur.execute("UPDATE products SET stock=%s WHERE id=%s", (stock, product_id))
    DB.commit()
    cur.close()

def update_payment(transaction_id,status) :
    cur = DB.cursor()
    cur.execute("UPDATE payment SET payment_status=%s WHERE transaction_id=%s", (status, transaction_id))
    DB.commit()
    cur.close()

def get_transactions_by_user(user_id):
    try:
        with DB.cursor(pymysql.cursors.DictCursor) as cursor:
            sql_transactions = "SELECT * FROM detection_product.transactions WHERE user_id = %s"
            cursor.execute(sql_transactions, (user_id,))
            transactions = cursor.fetchall()

            for transaction in transactions:
                sql_details = "SELECT * FROM detection_product.detail_transaction WHERE transaction_id = %s"
                cursor.execute(sql_details, (transaction['transaction_id'],))
                transaction['items'] = cursor.fetchall()

                sql_payment = "SELECT * FROM detection_product.payment WHERE transaction_id = %s"
                cursor.execute(sql_payment, (transaction['transaction_id'],))
                transaction['payment'] = cursor.fetchone()

            return transactions
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")
    
def get_product_price(product_id):
    try:
        with DB.cursor() as cursor:
            sql = "SELECT price FROM detection_product.products WHERE product_id = %s"
            cursor.execute(sql, (product_id,))
            result = cursor.fetchone()
            if result:
                return result[0]
            else:
                raise Exception(f"Product with ID {product_id} not found")
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")
    
def get_product_price_by_name(product_name):
    try:
        with DB.cursor() as cursor:
            sql = "SELECT price FROM detection_product.products WHERE product_name = %s"
            cursor.execute(sql, (product_name,))
            result = cursor.fetchone()
            if result:
                return result[0]
            else:
                raise Exception(f"Product with Name {product_name} not found")
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def create_transaction(transaction_details, payment_info):
    try:
        transaction_id = str(uuid4())
        total_price = 0
        time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        print(time)
        with DB.cursor() as cursor:
            for item in transaction_details['items']:
                price = get_product_price(item['product_id'])
                total_price += price * item['qty']
            sql_transaction = "INSERT INTO detection_product.transactions (transaction_id, time, description, total_price, user_id) VALUES (%s, %s, %s, %s, %s)"
            cursor.execute(sql_transaction, (transaction_id, time , transaction_details['desc'],  total_price, transaction_details['user_id']))

            for item in transaction_details['items']:
                sql_detail = "INSERT INTO detection_product.detail_transaction (transaction_id, product_id, qty) VALUES (%s, %s, %s)"
                cursor.execute(sql_detail, (transaction_id, item['product_id'], item['qty']))

            sql_payment = "INSERT INTO detection_product.payment (transaction_id, payment_method, payment_status) VALUES (%s, %s, %s)"
            cursor.execute(sql_payment, (transaction_id, payment_info['method'], payment_info['status']))

            DB.commit()
            token = create_transaction_midtrans(transaction_id,total_price)
        return transaction_id,token
    except pymysql.MySQLError as e:
        DB.rollback()
        raise Exception(f"Database transaction failed: {str(e)}")

def get_transaction_details(transaction_id):
    try:
        with DB.cursor(pymysql.cursors.DictCursor) as cursor:
            sql_transaction = "SELECT * FROM detection_product.transactions WHERE transaction_id = %s"
            cursor.execute(sql_transaction, (transaction_id,))
            transaction = cursor.fetchone()

            if transaction:
                sql_details = "SELECT * FROM detection_product.detail_transaction WHERE transaction_id = %s"
                cursor.execute(sql_details, (transaction_id,))
                transaction['items'] = cursor.fetchall()

                sql_payment = "SELECT * FROM detection_product.payment WHERE transaction_id = %s"
                cursor.execute(sql_payment, (transaction_id,))
                transaction['payment'] = cursor.fetchone()

            return transaction
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")
    




