import subprocess
import psycopg2
from datetime import datetime
from config import DB_NAME_API, DB_USER_API, DB_PASSWORD_API

def check_apache_status():
    try:
        # Run the lampp status command
        result = subprocess.run(['sudo', '/opt/lampp/lampp', 'status'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
        # Parse the result to determine the status of Apache
        output = result.stdout.lower()
        apache_status = 'running' if 'apache is running' in output else 'not running'
        return apache_status
    except Exception as e:
        print(f"An error occurred: {e}")
        return 'error'

def update_service_status_to_db(app_name, service_name, server_name, running_status):
    # Prepare the data for insertion
    timestamp = datetime.now()
    data = (app_name, service_name, server_name, running_status)
    
    try:
        # Connect to the PostgreSQL database
        conn = psycopg2.connect(**db_params)
        cursor = conn.cursor()
        
        # Insert the data into the table
        insert_query = """
        INSERT INTO nms_app_service_status (app_name, service_name, web_server_name, running_status)
        VALUES (%s, %s, %s, %s)
        """
        cursor.execute(insert_query, data)
        
        # Commit the transaction
        conn.commit()
        
        print(f"Service status for {service_name} updated successfully.")
    except Exception as e:
        print(f"An error occurred while updating the database: {e}")
    finally:
        # Close the connection
        if conn:
            cursor.close()
            conn.close()

# Replace with your actual database connection parameters
PG_HOST = "localhost"
PG_USER = DB_USER_API
PG_PASSWORD = DB_PASSWORD_API
PG_DBNAME = DB_NAME_API
db_params = {
    'dbname': DB_NAME_API,
    'user': DB_USER_API,
    'password': DB_PASSWORD_API,
    'host': PG_HOST,
    'port': '5432'
}

# Example usage to check Apache service status
apache_status = check_apache_status()
update_service_status_to_db('APACHE SERVER', 'apache', 'APACHE', apache_status)
