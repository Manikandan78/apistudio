import os
import subprocess
from datetime import datetime, timedelta
import logging
import psycopg2

from config import DB_NAME_API, DB_USER_API, DB_PASSWORD_API
# MySQL database credentials
DB_USER = "root"
DB_PASSWORD = "Nanox@cse#@!2428"
DB_NAME = "kommunity"

# Backup directory
BACKUP_DIR = "/Backup/KOMMUNITY/"

# MySQL dump command
MYSQL_DUMP = "/usr/bin/mysqldump"

# Log file
LOG_FILE = "/Backup/KOMMUNITY/kommunity.log"

# PostgreSQL database connection details
PG_HOST = "localhost"
PG_USER = DB_USER_API
PG_PASSWORD = DB_PASSWORD_API
PG_DBNAME = DB_NAME_API

# Set up logging
logging.basicConfig(filename=LOG_FILE, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Get the current date and time
CURRENT_DATE = datetime.now().strftime("%Y%m%d-%H%M%S")

# Create the backup directory if it doesn't exist
os.makedirs(BACKUP_DIR, exist_ok=True)

# Backup file for the target database
BACKUP_FILE = f"{BACKUP_DIR}/{DB_NAME}-{CURRENT_DATE}.sql"

# Create the backup for the target database with password provided non-interactively
command = [
    MYSQL_DUMP,
    "-u", DB_USER,
    "--password=" + DB_PASSWORD,
    "-h", "localhost",
    "--databases", DB_NAME
]

# Execute the mysqldump command and capture the result
with open(BACKUP_FILE, 'w') as backup_file:
    result = subprocess.run(command, stdout=backup_file, stderr=subprocess.PIPE)

# Determine backup status and file size
backup_status = "SUCCESS" if result.returncode == 0 else "FAILURE"
file_size = os.path.getsize(BACKUP_FILE) if result.returncode == 0 else 0

# Get hostname
hostname = subprocess.run(["hostname"], stdout=subprocess.PIPE).stdout.decode().strip()

# Calculate the next backup time (e.g., next day at the same time)
next_backup_time = datetime.now() + timedelta(days=1)

# Logging detailed information
logging.info(f"Backup Status: {backup_status}")
logging.info(f"Database Name: {DB_NAME}")
logging.info(f"Hostname: {hostname}")
logging.info(f"Database Engine: MySQL")
logging.info(f"Backup File Location: {BACKUP_DIR}")
logging.info(f"Backup File Name: {os.path.basename(BACKUP_FILE)}")
logging.info(f"Backup File Size: {file_size} bytes")

# Print detailed information
if backup_status == "SUCCESS":
    print(f"Backup of {DB_NAME} created successfully.")
    print(f"Backup file: {BACKUP_FILE}")
    print(f"Backup file size: {file_size} bytes")
else:
    error_message = f"Error creating backup: {result.stderr.decode('utf-8')}"
    logging.error(error_message)
    print(error_message)

# Insert backup details into the PostgreSQL database
try:
    conn = psycopg2.connect(
        host=PG_HOST,
        dbname=PG_DBNAME,
        user=PG_USER,
        password=PG_PASSWORD
    )
    cursor = conn.cursor()
    insert_query = """
    INSERT INTO backup_details (
        db_engine, db_name, file_name, file_size, file_path, 
        backup_status, last_backup_time, next_backup_time, host_name
    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    data = (
        "MySQL", DB_NAME, os.path.basename(BACKUP_FILE), file_size, BACKUP_DIR,
        backup_status, datetime.now(), next_backup_time, hostname
    )

    cursor.execute(insert_query, data)
    conn.commit()
    cursor.close()
    conn.close()

    logging.info("Backup details stored in the PostgreSQL database.")
except Exception as e:
    logging.error(f"Failed to store backup details in the database: {str(e)}")
    print(f"Failed to store backup details in the database: {str(e)}")