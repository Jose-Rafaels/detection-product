import bcrypt

# generating the salt 
# salt = bcrypt.gensalt() 
def hash_password(password) : 
    res = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
    return res

def check_password(password, hash) : 
    res = bcrypt.checkpw(password.encode('utf-8'), hash.encode('utf-8'))
    return res

