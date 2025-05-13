#!/bin/bash

echo "🚀 Activating Python virtual environment..."
source /home/mani/API-STUDIO/ApiStudio/venv/bin/activate

echo "📦 Starting Django backend on port 8005..."
nohup python /home/mani/API-STUDIO/ApiStudio/manage.py runserver 0.0.0.0:8005 > logs/django.log 2>&1 &

sleep 3

echo "🧠 Starting FastAPI: Authentication on port 8011..."
nohup uvicorn scripts.auth:app --host 0.0.0.0 --port 8011 
echo "🧠 Starting FastAPI: CrudApp on port 8012..."
nohup uvicorn scripts.crudapp:app --host 0.0.0.0 --port 8000 > 
echo "🛠 Running intermediate script: generate_token.py"
python scripts/generate_token.py

echo "✅ All services started. Access via:"
echo "  🔗 Django:     http://<your-ip>:8005/"
echo "  🔗 Auth API:   http://<your-ip>:8011/docs"
echo "  🔗 CRUD API:   http://<your-ip>:8012/docs"

