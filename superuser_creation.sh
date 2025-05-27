#!/bin/bash

# ---- CONFIG ----
USER="admin"
EMAIL="admin@example.com"
PASSWORD="admin"
PROJECT_DIR="$HOME/API-STUDIO/ApiStudio"  

# ---- SETUP ----
cd "$PROJECT_DIR" || exit

echo "🔄 Applying migrations..."
python3 manage.py migrate

echo "🧑‍💻 Creating superuser..."
echo "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='$USER').exists():
    User.objects.create_superuser('$USER', '$EMAIL', '$PASSWORD')
" | python3 manage.py shell

