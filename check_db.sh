#!/bin/bash

# === Set the full path to your Django project directory ===
PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"  # 🔁 CHANGE THIS IF NEEDED

# === Configuration Variables ===
export DB_NAME="apicloud"
export DB_USER="microapi"
export DB_PASSWORD="M!cr0ap!*CSE*"
export DB_HOST="127.0.0.1"  # 🔁 Use your updated host here
export DB_PORT="5432"
export DB_SCHEMA="apistudio"
VENV_PATH="$PROJECT_DIR/venv"
PORT=8005

# === Change to project directory ===
cd "$PROJECT_DIR" || { echo "❌ Project directory not found: $PROJECT_DIR"; exit 1; }

# === Create Virtual Environment If Not Exists ===
echo "🐍 Setting up virtual environment..."
if [ ! -d "$VENV_PATH" ]; then
    python3 -m venv "$VENV_PATH"
fi

# === Activate Virtual Environment ===
source "$VENV_PATH/bin/activate"

# === Install dependencies ===
echo "📦 Installing required Python packages..."
pip install --upgrade pip
pip install -r "$PROJECT_DIR/requirements.txt" || pip install psycopg2-binary

# === PostgreSQL Connection Test with psycopg2 ===
echo "🧪 Testing PostgreSQL connection with psycopg2..."
python<<END
import psycopg2

try:
    conn = psycopg2.connect(
        dbname="apicloud",
        user="microapi",
        password="M!cr0ap!*C$E*",
        host="127.0.0.1",
        port="5432"
    )
    print("✅ Connected to database.")
    conn.close()
except Exception as e:
    print("❌ Connection failed:", e)
END

# === Ensure Database and User Exist ===
echo "🛠 Creating database and user if they do not exist..."
sudo -u postgres psql << EOF
DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME') THEN
        CREATE DATABASE $DB_NAME;
    END IF;
END
\$\$;

DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '$DB_USER') THEN
        CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';
    END IF;
END
\$\$;

GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

# === Ensure Schema Exists ===
echo "🏗 Ensuring schema '$DB_SCHEMA' exists..."
PGPASSWORD="$DB_PASSWORD" psql -U "$DB_USER" -d "$DB_NAME" -h "$DB_HOST" --no-password --command="CREATE SCHEMA IF NOT EXISTS $DB_SCHEMA AUTHORIZATION $DB_USER;"

echo "🚀 Applying Django migrations..."
python "$PROJECT_DIR/manage.py" migrate

# === Kill existing process on port if running ===
PID=$(lsof -t -i:$PORT)

if [ -n "$PID" ]; then
    echo "Port $PORT is in use. Killing process with PID $PID..."
    sudo kill -9 $PID
    echo "Process killed. Port $PORT is now free."
else
    echo "Port $PORT is free."
fi

