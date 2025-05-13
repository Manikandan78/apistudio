import os
import subprocess
from datetime import datetime, timedelta
import logging
import psycopg2
# PostgreSQL database credentials
from config import DB_NAME_API, DB_USER_API, DB_PASSWORD_API, DB_NAME_ECOM, DB_USER_ECOM, DB_PASSWORD_ECOM

DB_USER = DB_USER_ECOM
DB_PASSWORD = DB_PASSWORD_ECOM
DB_NAME = DB_NAME_ECOM

# Backup directory
BACKUP_DIR = "/Backup/ECOM/"

# Log file
LOG_FILE = "/Backup/ECOM/ECOM.log"

# PostgreSQL dump command
PG_DUMP = "/usr/bin/pg_dump"

# Set up logging
logging.basicConfig(filename=LOG_FILE, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Get the current date and time
CURRENT_DATE = datetime.now().strftime("%Y%m%d-%H%M%S")

# Create the backup directory if it doesn't exist
os.makedirs(BACKUP_DIR, exist_ok=True)

# Backup file for the target database
BACKUP_FILE = f"{BACKUP_DIR}/ECOM-{CURRENT_DATE}.sql"

# PostgreSQL dump command
command = [
    PG_DUMP,
    "-h", "localhost",
    "-U", DB_USER,
    "-d", DB_NAME,
    "-Fp",  # Custom format backup
    "-f", BACKUP_FILE
]
# Set the PGPASSWORD environment variable
env = os.environ.copy()
env['PGPASSWORD'] = DB_PASSWORD

# Execute the pg_dump command and capture the result
result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=env)

# Determine backup status and file size
backup_status = "SUCCESS" if result.returncode == 0 else "FAILURE"
file_size = os.path.getsize(BACKUP_FILE) if result.returncode == 0 else 0

# Get hostname
hostname = subprocess.run(["hostname"], stdout=subprocess.PIPE).stdout.decode().strip()

# Calculate the next backup time (e.g., next day at the same time)
current_time = datetime.now().time()
next_backup_time = (datetime.combine(datetime.now().date() + timedelta(days=1), current_time)).time()

# Logging detailed information
logging.info(f"Backup Status: {backup_status}")
logging.info(f"Database Name: {DB_NAME}")
logging.info(f"Hostname: {hostname}")
logging.info(f"Database Engine: PostgreSQL")
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
        host="localhost",
        dbname=DB_NAME_API,
        user=DB_USER_API,
        password=DB_PASSWORD_API
    )
    cursor = conn.cursor()
    insert_query = """
    INSERT INTO nms_backup (
        app_name, db_engine, db_name, backup_file_name, backup_file_size, backup_file_loca,
        backup_status, prev_backup_time, next_backup_time, host_name
    ) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    data = (
        "ECOMMERCE", "PostgreSQL", DB_NAME, os.path.basename(BACKUP_FILE), file_size, BACKUP_DIR,
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
