Step 1 — Inspect the data
north_df.head()        # first few rows
north_df.info()        # column types, non-null counts
north_df.describe()    # summary statistics for numeric columns
north_df.columns       # check column names

Step 2 — Check for missing values
north_df.isna().sum()
south_df.isna().sum()
# Columns with 0 → no missing data

# Columns with >0 → you may need to fill or drop them
# Step 3 — Standardize categorical columns
north_df["Sale"].value_counts()
# Look for inconsistent capitalization or extra spaces
# Example: "YES", "yes", "YES "
# Fix it:
north_df["Sale"] = north_df["Sale"].str.upper().str.strip()
south_df["Sale"] = south_df["Sale"].str.upper().str.strip()

# Step 4 — Ensure numeric columns are numeric
north_df.dtypes
north_df["Incoming Wait Time"] = pd.to_numeric(north_df["Incoming Wait Time"], errors="coerce")

# Step 5 — Drop unnecessary columns (optional)
north_df = north_df.drop(columns=["Unnamed: 0"])
south_df = south_df.drop(columns=["Unnamed: 0"])

# Step 6 — Check for duplicates
north_df.duplicated().sum()
south_df.duplicated().sum()
# If duplicates exist, you can drop them:
north_df.drop_duplicates(inplace=True)
south_df.drop_duplicates(inplace=True)
# Step 7 — Combine datasets (if needed for analysis)
north_df["Branch"] = "North"
south_df["Branch"] = "South"

combined_df = pd.concat([north_df, south_df], ignore_index=True)
# Step 8 — Verify cleaned data
combined_df.info()
combined_df.head()
combined_df.isna().sum()
