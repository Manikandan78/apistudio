#!/bin/bash

echo " Setting up systemd services for all projects in NANOX-API-STUDIO-master..."

PROJECT_DIR="/home/$USER/NANOX-API-STUDIO-master"
PYTHON_VENV_NAME="venv"

# Define projects with their port numbers
declare -A projects=(
    ["ApiStudio"]=8005
    ["CoreApi"]=8007
    ["Datamigration"]=8002
    ["GetApi"]=8001
    ["Authentication"]=8011
    ["CrudApp"]=8000
    ["DeleteApi"]=8004
    ["PostApi"]=8002
    ["Sqlviews"]=8009
    ["CmsPage"]=8009
    ["DBSchemaApi"]=8006
    ["UpdateApi"]=8003
)

# Function to create virtual environment and install dependencies
setup_project_env() {
    project_name=$1
    project_path="$PROJECT_DIR/$project_name"

    echo "📂 Setting up $project_name at $project_path..."
    
    if [ ! -d "$project_path/$PYTHON_VENV_NAME" ]; then
        echo "⚡ Creating virtual environment..."
        python3 -m venv "$project_path/$PYTHON_VENV_NAME"
    fi

    echo "📦 Installing dependencies..."
    source "$project_path/$PYTHON_VENV_NAME/bin/activate"
    pip install --upgrade pip
    pip install -r "$project_path/req.txt"
    deactivate
}

# Function to create systemd service file
create_systemd_service() {
    project_name=$1
    port=$2
    service_file="/etc/systemd/system/${project_name}.service"

    echo "📝 Creating systemd service for $project_name on port $port..."

    sudo bash -c "cat > $service_file" <<EOL
[Unit]
Description=${project_name} Service
After=network.target

[Service]
User=$USER
WorkingDirectory=$PROJECT_DIR/$project_name
ExecStart=$PROJECT_DIR/$project_name/$PYTHON_VENV_NAME/bin/uvicorn main:app --host 0.0.0.0 --port $port
Restart=always
StandardOutput=journal
StandardError=journal
Environment=PYTHONUNBUFFERED=1

[Install]
WantedBy=multi-user.target
EOL

    sudo systemctl daemon-reload
    sudo systemctl enable ${project_name}.service
    sudo systemctl restart ${project_name}.service
}

# Loop through all projects, create virtual environments, install dependencies, and create systemd services
for project in "${!projects[@]}"; do
    setup_project_env "$project"
    create_systemd_service "$project" "${projects[$project]}"
done

echo "✅ All projects are set up and running as services!"
