from flask import Flask, request, jsonify
import os
from uuid import uuid4
from model import *
from helper.password import hash_password, check_password
from helper.lingkungan import secret_key

app = Flask(__name__)

app.config['UPLOAD_FOLDER'] = 'uploads'
app.secret_key = secret_key
unique_filename = ''
model_path = 'models/best.pt'

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'png', 'jpg', 'jpeg', 'jfif'}

def generate_unique_filename(file):
    ext = file.filename.rsplit('.', 1)[1].lower()
    unique_filename = f"{uuid4()}.{ext}"
    return unique_filename

@app.route('/')
def index():
    return jsonify({"status": "success"})

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data['username']
    email = data['email']
    password = data['password']

    # Check if username or email already exists
    try:
        existing_user = get_user_by_username(username)
        if existing_user:
            return jsonify(status="error", message="Username already exists"), 400

        existing_email = get_user_by_email(email)
        if existing_email:
            return jsonify(status="error", message="Email already exists"), 400

        hashed_password = hash_password(password)
        add_user(username, email, hashed_password)
        return jsonify(status="success", message="User registered successfully"), 201
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    password = data['password']

    try:
        user = get_user_by_email(email)
        if user and check_password(password, user['password']):
            return jsonify(status="success", message="Login successful", user_id=user['user_id'], username=user['username']), 200
        else:
            return jsonify(status="error", message="Invalid email or password"), 401
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/products', methods=['GET'])
def products_get():
    try:
        res = get_products()
        return jsonify(status="success", products = res), 200
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/order', methods=['POST'])
def create_new_order():
    data = request.get_json()
    user_id = data['user_id']
    order_items = data['order_items']

    try:
        order_id = create_order(user_id, order_items)
        return jsonify(status="success", message="Order created successfully", order_id=order_id), 201
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/order/<order_id>', methods=['GET'])
def get_order(order_id):
    try:
        order = get_order_details(order_id)
        if order:
            return jsonify(status="success", order=order), 200
        else:
            return jsonify(status="error", message="Order not found"), 404
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/orders/user/<user_id>', methods=['GET'])
def get_user_orders(user_id):
    try:
        orders = get_orders_by_user(user_id)
        if orders:
            return jsonify(status="success", orders=orders), 200
        else:
            return jsonify(status="error", message="No orders found for this user"), 404
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/charge', methods=['POST'])
def add_new_payment():
    data = request.get_json()
    payment_type = data['payment_type']
    order_details = data['order_details']

    try:
        process_payment(order_details, payment_type)
        return jsonify(status="success", message="Payment processed successfully"), 201
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/upload', methods=['POST'])
def upload_file():
    user_id = request.form.get('user_id')
    file = request.files.get('file')

    if not file:
        return jsonify(status="error", message="No file part"), 400

    if file.filename == '':
        return jsonify(status="error", message="No selected file"), 400

    if not allowed_file(file.filename):
        return jsonify(status="error", message="File type not allowed"), 400

    if not user_id:
        return jsonify(status="error", message="User ID is required"), 400

    unique_filename = generate_unique_filename(file)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
    file.save(filepath)
    from yolov5 import detect
    try:
        res = detect.run(weights=model_path, source=filepath, nosave=True)
        if os.path.exists(f"test-image/{unique_filename}"):
            os.remove(f"test-image/{unique_filename}")
        del detect
        if not res:
            return jsonify(status="error", message="Not Found"), 404

        for item in res:
             item['product_id'] ,item['price'] = get_product_price_by_name(item['product'])

        order_id , token = create_order(user_id, res)
        return jsonify(status="success", message="File uploaded and order created successfully", order_id=order_id,  products=res, token=token), 201

    except Exception as e:
        return jsonify(status="error", message=str(e)), 500


@app.route('/webhook', methods=['POST'])
def handle_webhook():
    data = request.get_json()
    order_id = data.get('order_id')
    transaction_status = data.get('transaction_status')

    if not order_id or not transaction_status:
        return jsonify(status="error", message="Invalid request payload"), 400

    try:
        update_payment_status(order_id, transaction_status)
        return jsonify(status="success", message="Payment status updated successfully"), 200
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500


if not os.path.exists(app.config['UPLOAD_FOLDER']):
    os.makedirs(app.config['UPLOAD_FOLDER'])

if __name__ == '__main__':
    app.run(debug=True)

else :
    gunicorn_app = app
