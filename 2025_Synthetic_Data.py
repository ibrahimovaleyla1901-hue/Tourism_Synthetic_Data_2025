# %%
import numpy as numpy
import pandas as pd

# %%
data = "Tourism_Analytics_2025_Synthetic_Data.xlsx"
incoming = pd.read_excel(data, sheet_name="Incoming_Tourism")
outgoing = pd.read_excel(data, sheet_name="Outgoing_Tourism")

# %%
incoming["Revenue_per_Manager"] = (
    incoming["Incoming_Revenue_USD"] / incoming["Incoming_Managers"]
)

# %%
incoming.describe()

# %%
outgoing["Revenue_per_Manager"] = (
    outgoing["Outgoing_Revenue_USD"] / outgoing["Outgoing_Managers"]
)

# %%
outgoing.describe()

# %%


# %%



