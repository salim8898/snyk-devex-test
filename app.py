import subprocess
import sqlite3

def run_command(user_input):
    # Command injection vulnerability
    subprocess.call(user_input, shell=True)

def query_user(user_id):
    # SQL injection vulnerability
    conn = sqlite3.connect('users.db')
    query = f"SELECT * FROM users WHERE id = {user_id}"
    return conn.execute(query).fetchall()

def process_file(filename):
    # Path traversal vulnerability
    with open(filename, 'r') as f:
        return f.read()
