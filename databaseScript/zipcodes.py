import re
import pandas as pd
from sqlalchemy import create_engine, text

# --- CONFIGURE THESE ---
DB_USER = "jean-pierrebenavidescruzatte"
DB_PASS = "BenavidesJ23"
DB_NAME = "roastdb"
DB_HOST = "localhost"
DB_PORT = "5433"
# ------------------------

engine = create_engine(f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# 1️⃣ Load the data
df = pd.read_sql("SELECT coffeepk, city FROM coffees;", engine)

# 2️⃣ Define regex extractor
def extract_zip(city_value):
    if not city_value:
        return None
    match = re.search(r"\b\d{5}\b", city_value)
    if match:
        return match.group(0)
    return None

# 3️⃣ Apply extraction
df["zipcode"] = df["city"].apply(extract_zip)

# 4️⃣ Push ZIPs back into database
with engine.connect() as conn:
    # Add the zipcode column
    conn.execute(text("ALTER TABLE coffees ADD COLUMN IF NOT EXISTS zipcode VARCHAR(10);"))
    conn.commit()

# Create temp table with the zipcode data
df[["coffeepk", "zipcode"]].to_sql("coffee_shop_zip_temp", engine, if_exists="replace", index=False)

# Update the main table
with engine.connect() as conn:
    conn.execute(text("""
        UPDATE coffees AS c
        SET zipcode = z.zipcode
        FROM coffee_shop_zip_temp AS z
        WHERE c.coffeepk = z.coffeepk;
    """))
    conn.commit()

print("✅ Done! Extracted ZIP codes from city column and added them to coffee_shops.zipcode.")
