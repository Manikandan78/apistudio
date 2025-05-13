#!/bin/bash

set -e  # Exit on error

# Function to check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

echo "🔍 Checking Python 3.11 installation..."
if command_exists python3.11; then
    echo "✅ Python 3.11 is already installed. Skipping installation."
else
    echo "⏳ Installing Python 3.11 from source..."
    sudo apt update
    sudo apt install -y wget build-essential libssl-dev zlib1g-dev \
        libreadline-dev libsqlite3-dev libgdbm-dev libbz2-dev liblzma-dev \
        libffi-dev libncurses-dev tk-dev uuid-dev libxml2-dev libxmlsec1-dev

    cd /tmp
    wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz
    tar -xzf Python-3.11.6.tgz
    cd Python-3.11.6
    ./configure --enable-optimizations
    make -j$(nproc)
    sudo make altinstall
    echo "✅ Python 3.11 installation completed."
fi

echo "🔍 Checking PostgreSQL installation..."
if command_exists psql; then
    echo "✅ PostgreSQL is already installed. Skipping installation."
else
    echo "⏳ Installing PostgreSQL from source..."
    sudo apt update
    sudo apt install -y wget libreadline-dev zlib1g-dev flex bison

    cd /tmp
    wget https://ftp.postgresql.org/pub/source/v15.6/postgresql-15.6.tar.bz2
    tar -xf postgresql-15.6.tar.bz2
    cd postgresql-15.6
    ./configure
    make -j$(nproc)
    sudo make install

    sudo useradd -m -s /bin/bash postgres || true
    sudo mkdir -p /usr/local/pgsql/data
    sudo chown postgres /usr/local/pgsql/data
    sudo -u postgres /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data

    echo "✅ PostgreSQL 15.6 installation completed."
fi

echo "🔍 Checking NGINX installation..."
if command_exists nginx; then
    echo "✅ NGINX is already installed. Skipping installation."
else
    echo "⏳ Installing NGINX from source..."
    sudo apt update
    sudo apt install -y wget build-essential libpcre3 libpcre3-dev zlib1g-dev libssl-dev

    cd /tmp
    wget https://nginx.org/download/nginx-1.25.4.tar.gz
    tar -xzf nginx-1.25.4.tar.gz
    cd nginx-1.25.4
    ./configure
    make -j$(nproc)
    sudo make install
    echo "✅ NGINX 1.25.4 installation completed."
fi

echo "🔎 Verifying installed versions..."
python3.11 --version || echo "⚠️ Python 3.11 verification failed!"
/usr/local/pgsql/bin/psql --version || echo "⚠️ PostgreSQL 15.6 verification failed!"
/usr/local/nginx/sbin/nginx -v || echo "⚠️ NGINX 1.25.4 verification failed!"

echo "🎉 Setup complete! All prerequisites for API Studio are installed."
