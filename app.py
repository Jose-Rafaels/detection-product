from flask import Flask, request, jsonify
from db import db
import os
import uuid
import json
from yolov5 import detect
# Initialize the Flask application
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'test-image/'
app.secret_key = 'your-secret-key'
unique_filename = ''
model_path = 'models/best.pt'  # Path to your custom YOLOv5 model


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in {'png', 'jpg', 'jpeg'}

def generate_unique_filename(file):
    ext = file.filename.rsplit('.', 1)[1].lower()
    unique_filename = f"{uuid.uuid4()}.{ext}"
    return unique_filename

@app.route('/')
def index():
    return jsonify({"success":"true"})

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({"success":"false"})

    file = request.files['file']
    if file.filename == '':
        return jsonify({"success":"false"})

    if file and allowed_file(file.filename):
        unique_filename = generate_unique_filename(file)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
        file.save(filepath)
        res = detect.run(weights =model_path, source = filepath,nosave=True)
        data = {}
        if os.path.exists("test-image/"+unique_filename):
            os.remove("test-image/"+unique_filename)
        if res != [] : 
            data["success"]= "true"
            data["res"] = [res]
            for item in data['res']:
                item['price'] = db.search_price(item['product'])

            # Convert the updated dictionary to JSON
            json_string = json.dumps(data, indent=4)
            return json_string
        else :
            return jsonify({"success":"false", "res" : "Not Found"})

        
    else:
        return jsonify({"success":"false"})


if __name__ == '__main__':
    if not os.path.exists(app.config['UPLOAD_FOLDER']):
        os.makedirs(app.config['UPLOAD_FOLDER'])
    app.run(debug=True)
