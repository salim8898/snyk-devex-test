import subprocess
import os

# Command injection - should be HIGH severity
def execute_command(user_input):
    subprocess.call(user_input, shell=True)
    os.system(user_input)

# SQL injection - should be HIGH severity  
def unsafe_query(user_id):
    query = f"DELETE FROM users WHERE id = {user_id}"
    return query
