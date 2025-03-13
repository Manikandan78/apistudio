#!/bin/bash
set -e

echo "🔹 Installing required system packages..."
sudo apt update && sudo apt install -y git curl wget python3-venv python3-pip postgresql postgresql-contrib nginx systemd

echo " System dependencies installed!"
