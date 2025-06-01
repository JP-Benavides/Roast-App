import pandas as pd

# Load original CSV
df = pd.read_csv("cafe_data.csv")

# Keep only the first 19 columns
df.iloc[:, :19].to_csv("cafe_data_trimmed.csv", index=False)