#!/bin/bash
set -e

./setup_nix.sh
./setup_package.sh
./setup_project.sh
./setup_service.sh
./upload_to_git.sh

echo "✅ All steps completed successfully!"
