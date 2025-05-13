import os
import subprocess
from datetime import datetime
from config import DB_USER_HELPDESK, DB_NAME_HELPDESK, DB_PASSWORD_HELPDESK

def custom_api():
    db_user = DB_USER_HELPDESK
    db_name = DB_NAME_HELPDESK
    db_password = DB_PASSWORD_HELPDESK
    
    current_date = datetime.now().strftime("%d-%m-%Y-%H-%M %p")
    backup_dir = "/Backup/HELPDESK"
    backup_log_dir = "/Backup/HELPDESK/LOG"
    
    # Ensure backup and log directories exist
    os.makedirs(backup_dir, exist_ok=True)
    os.makedirs(backup_log_dir, exist_ok=True)

    # Backup command
    timestamp = datetime.now().strftime("%d-%m-%Y-%H-%M")
    backup_file = f"{backup_dir}/HELPDESK-{timestamp}.sql"
    log_file = f"{backup_log_dir}/HELPDESK-{timestamp}.log"
    
    dump_command = [
        "pg_dump",
        "-U", db_user,
        "-d", db_name,
        "--schema=helpnanox",
        "--verbose"
    ]
    
    env = os.environ.copy()
    env["PGPASSWORD"] = db_password

    try:
        with open(backup_file, "w") as bf, open(log_file, "w") as lf:
            result = subprocess.run(dump_command, stdout=bf, stderr=lf, env=env, check=True)
        return {"message": "Backup successfully completed"}
    except subprocess.CalledProcessError as e:
        with open(log_file, "r") as lf:
            log_content = lf.read()
        return {"message": f"Backup failed: {str(e)}", "log": log_content}

# Run the function
custom_api()
#print(result)