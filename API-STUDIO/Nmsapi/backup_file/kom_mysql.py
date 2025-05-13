import os
import subprocess
from datetime import datetime
import logging

# MySQL database credentials
DB_USER = "root"
DB_PASSWORD = "Nanox@cse#@!2428"

# Database to backup
TARGET_DATABASE = "kommunity"

# Backup directory
BACKUP_DIR = "/Backup/KOMMUNITY/"

# MySQL dump command
MYSQL_DUMP = "/usr/bin/mysqldump"

# Log file
LOG_FILE = "/Backup/KOMMUNITY/backup.log"

# Set up logging
logging.basicConfig(filename=LOG_FILE, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Get the current date and time
CURRENT_DATE = datetime.now().strftime("%Y%m%d-%H%M%S")

# Create the backup directory if it doesn't exist
os.makedirs(BACKUP_DIR, exist_ok=True)

# Backup file for the target database
BACKUP_FILE = f"{BACKUP_DIR}/KOMMUNITY-{CURRENT_DATE}.sql"

# Create the backup for the target database with password provided non-interactively
command = [
    MYSQL_DUMP,
    "-u", DB_USER,
    "--password=" + DB_PASSWORD,
    "-h", "localhost",
    "--databases", TARGET_DATABASE
]

with open(BACKUP_FILE, 'w') as backup_file:
    result = subprocess.run(command, stdout=backup_file, stderr=subprocess.PIPE)

if result.returncode == 0:
    message = f"Backup of {TARGET_DATABASE} created: {BACKUP_FILE}"
    logging.info(message)
    print(message)
else:
    error_message = f"Error creating backup: {result.stderr.decode('utf-8')}"
    logging.error(error_message)
    print(error_message)

logging.info(f"Backup process completed at {datetime.now()}")
