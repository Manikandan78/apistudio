#!/bin/bash
# run_app.sh

# Run setup (create venv, install requirements)
bash /home/mani/Crudpp.sh

# Start the app using venv Python
/home/mani/API-STUDIO/CrudApp/venv/bin/python /home/mani/API-STUDIO/CrudApp/main.py
