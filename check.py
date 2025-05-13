import psycopg2

try:
    conn = psycopg2.connect(
        dbname="apicloud",
        user="microapi",
        password="M!cr0ap!*C$E*",
        host="10.255.255.254",
        port="5432"
    )
    print("✅ Connected to database.")
    conn.close()
except Exception as e:
    print("❌ Connection failed:", e)
