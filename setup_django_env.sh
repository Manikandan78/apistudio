#!/bin/bash

# Step 1: Navigate to your Django project directory
cd API-STUDIO/ApiStudio/ || { echo "Directory not found!"; exit 1; }

# Step 2: Create a virtual environment if not exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Step 3: Activate the virtual environment
source venv/bin/activate

# Step 4: Install requirements
if [ -f "requirements.txt" ]; then
    echo "Installing requirements..."
    pip install -r requirements.txt
else
    echo "requirements.txt not found!"
fi

# Step 5: Ensure Gunicorn is installed
if ! pip show gunicorn &>/dev/null; then
    echo "Installing Gunicorn..."
    pip install gunicorn
else
    echo "Gunicorn is already installed."
fi

# Step 6: Test gunicorn run
echo "Running Gunicorn test..."
gunicorn --bind 127.0.0.1:8005 ApiStudio.wsgi:application &

sleep 5
echo "✅ Gunicorn test run done. Stop this process if needed using 'killall gunicorn'"
