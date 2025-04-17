#!/bin/bash

# Set variables
PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"
VENV_DIR="$PROJECT_DIR/venv"
PYTHON_BIN="python3"

echo "Starting setup for Django project: apistudio"

# Step 1: Navigate to the project directory
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: Project directory '$PROJECT_DIR' does not exist!"
    exit 1
fi
cd "$PROJECT_DIR"

# Step 2: Create Virtual Environment (if not exists)
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    $PYTHON_BIN -m venv venv
else
    echo "Virtual environment already exists."
fi

# Step 3: Activate the Virtual Environment
source "$VENV_DIR/bin/activate"

# Step 4: Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install --upgrade pip
    pip install -r requirements.txt
else
    echo "Error: requirements.txt not found!"
    exit 1
fi

# Step 5: Run Django server
echo "Starting Django server..."
python manage.py runserver 127.0.0.1:8005 &

echo "Django project 'apistudio' is now running at http://localhost:8005"

exit 0
