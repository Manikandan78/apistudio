#!/usr/bin/env bash

set -e

# === Configuration ===
PG_USER="microapi"
PG_PASSWORD="M!cr0ap!*C$E*"
PG_DB="apicloud"
PG_SCHEMAS=("public" "apistudio")
PG_ADMIN_PORT=5432

# === 1. Create the PostgreSQL role ===
echo "🛠️  Creating PostgreSQL role '${PG_USER}'..."
sudo -u postgres psql -tc "SELECT 1 FROM pg_roles WHERE rolname='${PG_USER}'" | grep -q 1 || \
sudo -u postgres psql -c "CREATE ROLE ${PG_USER} WITH LOGIN PASSWORD '${PG_PASSWORD}';"

# === 2. Create the database ===
echo "🛠️  Creating database '${PG_DB}'..."
sudo -u postgres psql -tc "SELECT 1 FROM pg_database WHERE datname='${PG_DB}'" | grep -q 1 || \
sudo -u postgres createdb -O "${PG_USER}" "${PG_DB}"

# === 3. Create required schemas ===
echo "🛠️  Creating schemas in '${PG_DB}'..."
for schema in "${PG_SCHEMAS[@]}"; do
  sudo -u postgres psql -d "${PG_DB}" -tc "SELECT schema_name FROM information_schema.schemata WHERE schema_name = '${schema}'" | grep -q "${schema}" || \
  sudo -u postgres psql -d "${PG_DB}" -c "CREATE SCHEMA ${schema} AUTHORIZATION ${PG_USER};"
done

# === 4. Install pgAdmin if not present ===
echo "🔍 Checking for pgAdmin..."
if ! command -v pgadmin4 &> /dev/null; then
  echo "📦 pgAdmin not found. Installing pgAdmin 4..."

  # Add the pgAdmin APT repository (for Ubuntu/Debian)
  curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | gpg --dearmor | sudo tee /usr/share/keyrings/pgadmin.gpg > /dev/null

  echo "deb [signed-by=/usr/share/keyrings/pgadmin.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" | \
    sudo tee /etc/apt/sources.list.d/pgadmin4.list

  sudo apt update

  # Install pgAdmin desktop mode (you can switch to web mode if preferred)
  sudo apt install -y pgadmin4-desktop

  echo "✅ pgAdmin installed successfully."
else
  echo "✅ pgAdmin is already installed."
fi

# === 5. Show connection info for pgAdmin ===
echo ""
echo "✅ PostgreSQL setup complete!"
echo "Database: $PG_DB"
echo "User: $PG_USER"
echo "Password: $PG_PASSWORD"
echo "Schemas created: ${PG_SCHEMAS[*]}"
echo ""
echo "📥 To connect via pgAdmin:"
echo "  Host: localhost"
echo "  Port: $PG_ADMIN_PORT"
echo "  Username: $PG_USER"
echo "  Password: $PG_PASSWORD"
echo ""

# === 6. Try to launch pgAdmin desktop ===
if command -v pgadmin4 &> /dev/null; then
  echo "🚀 Launching pgAdmin 4..."
  pgadmin4 &
else
  echo "⚠️ Could not launch pgAdmin automatically."
fi
