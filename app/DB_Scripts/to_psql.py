import pandas as pd 
from sqlalchemy import create_engine

#Open csv 
df = pd.read_csv("cafe_data.csv") 


#Postgres Data 
username = "jean-pierrebenavidescruzatte"
password = "BenavidesJ23"
host = "localhost"
port = "8080"
database = "ROAST"

#Upload to Postgres 
engine = create_engine(f'postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}')
df.to_sql("CoffeeShop_Table", engine, if_exists="replace", index=False)


print("Data uploaded")


