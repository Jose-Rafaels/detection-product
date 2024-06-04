import sqlite3

def create_db():
    conn = sqlite3.connect('toko.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS `products` (`product_id` tinyint(4) DEFAULT NULL,  `product_name` varchar(128) DEFAULT NULL, `product_price` integer DEFAULT NULL )''')
    conn.commit()
    conn.close()
def get_db_connection():        
    conn = sqlite3.connect('toko.db')
    return conn

# def insert_data(data):
#     conn = get_db_connection()
#     c = conn.cursor()
#     c.execute("INSERT INTO products (product_id , product_name ,product_price) VALUES (?,?,?)", (data[0], data[1], data[2]))
#     conn.commit()
#     conn.close()

def search_price(product_name) :
    conn = get_db_connection()
    c = conn.cursor()
    c.execute("SELECT product_price FROM products WHERE product_name =?", (product_name,))
    data = c.fetchone()
    conn.close()
    return data[0]

# def remove_table():
#     conn = get_db_connection()
#     c = conn.cursor()
#     c.execute("DROP TABLE products")
#     conn.commit()
#     conn.close()
# def get_all():
#     conn = get_db_connection()
#     c = conn.cursor()
#     c.execute("SELECT * FROM products")
#     data = c.fetchall()
#     conn.close()
#     return data




