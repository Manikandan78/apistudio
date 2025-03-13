#!/bin/bash
set -e

echo "🔹 Uploading latest project changes to GitHub..."
cd nix_project
git add .
git commit -m "Automated full setup completed"
git push origin main

echo " Project uploaded to GitHub!"
