#!/bin/bash

# === CONFIGURATION ===
USERNAME="admin"
EMAIL="admin123@gmail.com"
PASSWORD="admin"
PROJECT_DIR=$HOME/API-STUDIO/ApiStudio 

echo " Current directory: $PROJECT_DIR"

# === STEP 1: Ensure Python and pip are installed ===
echo " Checking Python and pip..."
if ! command -v python3 >/dev/null 2>&1; then
    echo " Python3 is not installed. Installing..."
    sudo apt update && sudo apt install python3 -y
fi

if ! command -v pip3 >/dev/null 2>&1; then
    echo " pip3 not found. Installing..."
    sudo apt install python3-pip -y
fi

# === STEP 2: Set up virtual environment ===
if [ ! -d "env" ]; then
    echo " Creating Python virtual environment..."
    python3 -m venv env
fi

echo " Activating virtual environment..."
source env/bin/activate

# === STEP 3: Install Django if not installed ===
if ! python -c "import django" 2>/dev/null; then
    echo " Django not found in virtual environment. Installing..."
    pip install --upgrade pip
    pip install django
else
    echo " Django already installed."
fi

# === STEP 4: Run migrations ===
if [ -f "manage.py" ]; then
    echo " Running migrations..."
    python3 manage.py migrate
else
    echo " manage.py not found. Are you in a Django project root?"
    exit 1
fi

# === STEP 5: Create superuser if not exists ===
echo " Checking for superuser '$USERNAME'..."

cat <<EOF > create_superuser.py
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='$USERNAME').exists():
    print(" Creating superuser '$USERNAME'...")
    User.objects.create_superuser(username='$USERNAME', email='$EMAIL', password='$PASSWORD')
else:
    print(" Superuser '$USERNAME' already exists.")
EOF

python manage.py shell < create_superuser.py
rm create_superuser.py

echo " Superuser setup complete: username='$USERNAME' | password='$PASSWORD'"
