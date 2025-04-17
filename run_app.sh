#!/bin/bash
# run_app.sh

# Run setup (create venv, install requirements)
bash /home/mani/Crudapp.sh

#!/bin/bash

# Exit if venv already exists and requirements are met
if [ ! -d "/home/mani/API-STUDIO/CrudApp/venv" ]; then
    python3 -m venv /home/mani/API-STUDIO/CrudApp/venv
fi

source /home/mani/API-STUDIO/CrudApp/venv/bin/activate

# Install only if not already satisfied
pip install --upgrade pip
pip install --no-cache-dir -r /home/mani/API-STUDIO/CrudApp/new_req.txt
