# secrets.py - Very obvious secrets
AWS_SECRET_KEY = "AKIAIOSFODNN7EXAMPLE"
DATABASE_URL = "postgresql://user:password123@localhost/db"
API_TOKEN = "sk-1234567890abcdefghijklmnop"

# sql_injection.py - Clear SQL injection
import sqlite3
def get_user(user_id):
    conn = sqlite3.connect('app.db')
    # Direct string concatenation - should trigger Snyk
    query = "SELECT * FROM users WHERE id = '" + user_id + "'"
    return conn.execute(query).fetchall()

# command_injection.py - Command injection
import os
def run_user_command(cmd):
    # Direct os.system call - should trigger Snyk
    os.system(cmd)
