import os

def unsafe_eval(user_code):
    # Code injection vulnerability
    eval(user_code)

def weak_crypto():
    # Weak cryptography
    import hashlib
    return hashlib.md5(b"password").hexdigest()

