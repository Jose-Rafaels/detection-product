import pymysql
from uuid import uuid4
from helper.payment import create_transaction_midtrans
from helper.lingkungan import database_host, database_user, database_password, database_name
# Database configuration
db = pymysql.connect(
    host=database_host,
    user=database_user,
    password=database_password,
    db=database_name
)

def get_user_by_username(username):
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT user_id, username, email, password FROM detection_product.users WHERE username = %s"
            cursor.execute(sql, (username,))
            return cursor.fetchone()
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def get_username_by_user_id(user_id):
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            sql_user = "SELECT username FROM detection_product.users WHERE user_id = %s"
            cursor.execute(sql_user, (user_id,))
            user = cursor.fetchone()
            return user['username'] if user else None
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def get_user_by_email(email):
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            sql = "SELECT user_id, username, email, password FROM detection_product.users WHERE email = %s"
            cursor.execute(sql, (email,))
            return cursor.fetchone()
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def add_user(username, email, hashed_password):
    try:
        with db.cursor() as cursor:
            sql = "INSERT INTO detection_product.users (user_id, username, email, password) VALUES (%s, %s, %s, %s)"
            cursor.execute(sql, (str(uuid4()), username, email, hashed_password.decode('utf-8')))
            db.commit()
    except pymysql.MySQLError as e:
        raise Exception(f"Database insert failed: {str(e)}")


def get_products():
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            cursor.execute("SELECT * FROM detection_product.products")
            products = cursor.fetchall()
            return products
    except pymysql.MySQLError as e:
        print(f"Database query failed: {str(e)}")
        return None

def get_product_price(product_id):
    try:
        with db.cursor() as cursor:
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
        with db.cursor() as cursor:
            sql = "SELECT product_id, price FROM detection_product.products WHERE product_name = %s"
            cursor.execute(sql, (product_name,))
            result = cursor.fetchone()
            if result:
                return result[0], result[1]
            else:
                raise Exception(f"Product with Name {product_name} not found")
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")
    
def create_order(user_id, order_items):
    try:
        order_id = str(uuid4())
        total_price = 0

        with db.cursor() as cursor:
            for item in order_items:
                price = get_product_price(item['product_id'])
                total_price += price * item['total']

            sql_order = "INSERT INTO detection_product.orders (order_id, time, total_price, user_id) VALUES (%s, NOW(), %s, %s)"
            cursor.execute(sql_order, (order_id, total_price, user_id))

            for item in order_items:
                sql_detail = "INSERT INTO detection_product.order_details (order_id, product_id, qty) VALUES (%s, %s, %s)"
                cursor.execute(sql_detail, (order_id, item['product_id'], item['total']))

            db.commit()
            token = create_transaction_midtrans(order_id, total_price)
        return order_id , token
    except pymysql.MySQLError as e:
        db.rollback()
        raise Exception(f"Database order creation failed: {str(e)}")

def add_payment(order_id, payment_info):
    try:
        with db.cursor() as cursor:
            sql_payment = "INSERT INTO detection_product.payment (order_id, payment_method, payment_status) VALUES (%s, %s, %s)"
            cursor.execute(sql_payment, (order_id, payment_info['method'], payment_info['status']))
            db.commit()
    except pymysql.MySQLError as e:
        db.rollback()
        raise Exception(f"Database payment insertion failed: {str(e)}")

def get_order_details(order_id):
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            sql_order = "SELECT * FROM detection_product.orders WHERE order_id = %s"
            cursor.execute(sql_order, (order_id,))
            order = cursor.fetchone()

            if order:
                sql_details = """
                    SELECT od.qty, p.product_name, p.price
                    FROM detection_product.order_details od
                    JOIN detection_product.products p ON od.product_id = p.product_id
                    WHERE od.order_id = %s
                """
                cursor.execute(sql_details, (order_id,))
                order['items'] = cursor.fetchall()

                sql_payment = "SELECT payment_method, payment_status FROM detection_product.payment WHERE order_id = %s"
                cursor.execute(sql_payment, (order_id,))
                order['payment'] = cursor.fetchone()

            return order
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def get_orders_by_user(user_id):
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            sql_orders = "SELECT * FROM detection_product.orders WHERE user_id = %s"
            cursor.execute(sql_orders, (user_id,))
            orders = cursor.fetchall()

            for order in orders:
                sql_details = """
                    SELECT od.qty, p.product_name, p.price
                    FROM detection_product.order_details od
                    JOIN detection_product.products p ON od.product_id = p.product_id
                    WHERE od.order_id = %s
                """
                cursor.execute(sql_details, (order['order_id'],))
                order['items'] = cursor.fetchall()

                sql_payment = "SELECT payment_method, payment_status FROM detection_product.payment WHERE order_id = %s"
                cursor.execute(sql_payment, (order['order_id'],))
                order['payment'] = cursor.fetchone()

            return orders
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")
    
def get_orders_today():
    try:
        with db.cursor(pymysql.cursors.DictCursor) as cursor:
            sql_orders = """
                SELECT o.*, u.username
                FROM detection_product.orders o
                JOIN detection_product.users u ON o.user_id = u.user_id
                WHERE DATE(o.time) = CURDATE()
            """
            cursor.execute(sql_orders)
            orders = cursor.fetchall()

            for order in orders:
                sql_payment = "SELECT payment_method, payment_status FROM detection_product.payment WHERE order_id = %s"
                cursor.execute(sql_payment, (order['order_id'],))
                order['payment'] = cursor.fetchone()

            return orders
    except pymysql.MySQLError as e:
        raise Exception(f"Database query failed: {str(e)}")

def process_payment(order_details, payment_type):
    try:
        order_id = order_details['order_id']
        gross_amount = order_details['gross_amount']

        with db.cursor() as cursor:
            # Update the total price in the orders table
            sql_update_order = "UPDATE detection_product.orders SET WHERE order_id = %s"
            cursor.execute(sql_update_order, (order_id))

            # Insert into the payments table
            sql_payment = "INSERT INTO detection_product.payment (order_id, payment_method, payment_status) VALUES (%s, %s, %s)"
            cursor.execute(sql_payment, (order_id, payment_type, 'completed'))  # Assuming payment_status is 'completed'

            db.commit()
    except pymysql.MySQLError as e:
        db.rollback()
        raise Exception(f"Database payment processing failed: {str(e)}")

    
def update_payment_status(order_id, payment_status):
    try:
        with db.cursor() as cursor:
            sql_update_payment = "UPDATE detection_product.payment SET payment_status = %s WHERE order_id = %s"
            cursor.execute(sql_update_payment, (payment_status, order_id))
            db.commit()
    except pymysql.MySQLError as e:
        db.rollback()
        raise Exception(f"Database payment status update failed: {str(e)}")

