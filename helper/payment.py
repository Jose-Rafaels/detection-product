import midtransclient
import json
from helper.lingkungan import mid_trans_client, mid_trans_server
# Initialize the Midtrans Snap API client
snap = midtransclient.Snap(
    is_production=False,  # Set to True if you are in production environment
    server_key=mid_trans_server,  # Replace with your actual server key
    client_key=mid_trans_client   # Replace with your actual client key
)
# Prepare the transaction details
transaction_data = {}

def create_transaction_midtrans(payment_id,total) :
    try:
        # Create a Snap transaction
        transaction_details = {}
        transaction_details["order_id"] = payment_id
        transaction_details["gross_amount"]= total
        transaction_data["transaction_details"] = transaction_details
        res = json.dumps(transaction_data, indent=4)
        transaction_response = snap.create_transaction(res)

        # Print the transaction details
        # print('Transaction Token:', transaction_response['token'])
        # print('UUID :', transaction_details["order_id"])
        return transaction_response['token']
    except Exception as e:
        print('An error occurred:', str(e))
        return e