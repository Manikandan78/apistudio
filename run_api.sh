#!/bin/bash

set -e  # Exit on error

# List of scripts to run sequentially
scripts=(
        "Authentication.sh"
        "DeleteApi.sh"
        "UpdateApi.sh"
        "CmsPage.sh"
        "GetApi.sh"
        "CoreApi.sh"
        "Crudapp.sh"
        "PostApi.sh"
        "DBSchemaApi.sh"
        "Sqlviews.sh"
)

for script in "${scripts[@]}"; do
    echo "Running $script..."
    chmod +x "$script"  # Ensure it's executable
    ./"$script"  # Run the script
    echo "$script completed successfully!"
done

echo "All scripts executed successfully!"
