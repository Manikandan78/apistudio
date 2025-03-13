#!/bin/bash
set -e

echo "🔹 Activating virtual environment and starting project..."
source $HOME/nix_project/venv/bin/activate
python $HOME/nix_project/api.py &  

echo "✅ Project started!"
