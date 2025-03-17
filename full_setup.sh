#!/bin/bash
set -e

./setup_nix.sh
./setup_postgres.sh
./setup_project.sh
./setup_nginx.sh


echo "✅ All steps completed successfully!"
