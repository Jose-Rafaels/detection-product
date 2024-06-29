from os import getenv
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Get environment variables
database_client = getenv('DATABASE_CLIENT')
database_host = getenv('DATABASE_HOST')
database_port = getenv('DATABASE_PORT')
database_user = getenv('DATABASE_USER')
database_password = getenv('DATABASE_PASSWORD')
database_name = getenv('DATABASE_NAME')
secret_key = getenv('SECRET_KEY')
mid_trans_client = getenv('MID_TRANS_CLIENT')
mid_trans_server = getenv('MID_TRANS_SERVER')