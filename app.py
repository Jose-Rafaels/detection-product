from flask import Flask, request, jsonify
from model import *
from uuid import uuid4
from helper.password import hash_password, check_password
from yolov5 import detect
from helper.enviroment import secret_key
import os

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'test-image/'
app.secret_key = secret_key
unique_filename = ''
model_path = 'models/best.pt'
# Path to your custom YOLOv5 model

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'png', 'jpg', 'jpeg'}

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
    password = data['password']

    # Check if username already exists
    try:
        existing_user = get_user_by_username(username)
        if existing_user:
            return jsonify(status="error", message="Username already exists"), 400

        hashed_password = hash_password(password)
        add_user(username, hashed_password)
        return jsonify(status="success", message="User registered successfully"), 201
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data['username']
    password = data['password']

    try:
        user = get_user_by_username(username)
        if user and check_password(password, user['password']):
            return jsonify(status="success", message="Login successful"), 200
        else:
            return jsonify(status="error", message="Invalid username or password"), 401
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/products', methods=['GET'])
def get_products():
    try:
        res = get_product()
        return jsonify(status="success", products=res), 200
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/transaction', methods=['POST'])
def create_new_transaction():
    data = request.get_json()
    transaction_details = data['transaction_details']
    payment_info = data['payment_info']

    try:
        transaction_id = create_transaction(transaction_details, payment_info)
        return jsonify(status="success", message="Transaction created successfully", transaction_id=transaction_id), 201
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/transaction/<transaction_id>', methods=['GET'])
def get_transaction(transaction_id):
    try:
        transaction = get_transaction_details(transaction_id)
        if transaction:
            return jsonify(status="success", transaction=transaction), 200
        else:
            return jsonify(status="error", message="Transaction not found"), 404
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/transactions/user/<user_id>', methods=['GET'])
def get_user_transactions(user_id):
    try:
        transactions = get_transactions_by_user(user_id)
        if transactions:
            return jsonify(status="success", transactions=transactions), 200
        else:
            return jsonify(status="error", message="No transactions found for this user"), 404
    except Exception as e:
        return jsonify(status="error", message=str(e)), 500

@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files.get('file')

    if not file:
        return jsonify(status="error", message="No file part"), 400

    if file.filename == '':
        return jsonify(status="error", message="No selected file"), 400

    if not allowed_file(file.filename):
        return jsonify(status="error", message="File type not allowed"), 400

    unique_filename = generate_unique_filename(file)
    filepath = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
    file.save(filepath)
    
    res = detect.run(weights=model_path, source=filepath, nosave=True)
    
    if os.path.exists(f"test-image/{unique_filename}"):
        os.remove(f"test-image/{unique_filename}")

    if not res:
        return jsonify(status="error", message="Not Found"), 404

    data = {
        "status": "success",
        "res": res
    }

    for item in data['res']:
        item['price'] = get_product_price_by_name(item['product'])

    return jsonify(data), 200

if __name__ == '__main__':
    if not os.path.exists(app.config['UPLOAD_FOLDER']):
        os.makedirs(app.config['UPLOAD_FOLDER'])
    app.run(debug=True)