# q2 Graphical and numerical summaries
import pandas as pd

# Read the data from the Excel file
df = pd.read_excel("Week 5 Assignment.xlsx")

# Assuming the data structure remains the same, calculate descriptive statistics
time_stats = df["Time (min)"].describe()
pages_stats = df["Pages Viewed"].describe()
amount_stats = df["Amount Spent ($)"].describe()

# Print the results
print("Length of Time on Website:")
print(time_stats)

print("\nNumber of Pages Viewed:")
print(pages_stats)

print("\nMean Amount Spent:")
print(amount_stats)

# q3 
import pandas as pd

# Read the data from the Excel file
df = pd.read_excel("Week 5 Assignment.xlsx")

# Group data by day of the week and calculate statistics
day_groups = df.groupby("Day")
day_stats = day_groups.agg(
    Frequency=("Customer", "count"),
    Total_Spent=("Amount Spent ($)", "sum"),
    Mean_Spent=("Amount Spent ($)", "mean")
)

# Print the results
print(day_stats)

#q4
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load data
df = pd.read_excel("Week 5 Assignment.xlsx")

# Create scatter plot
plt.figure(figsize=(10, 6))
plt.scatter(df["Time (min)"], df["Amount Spent ($)"])
plt.xlabel("Time Spent on Website (min)")
plt.ylabel("Amount Spent ($)")
plt.title("Time Spent vs. Amount Spent")
plt.grid(True)

# Calculate correlation coefficient
correlation = np.corrcoef(df["Time (min)"], df["Amount Spent ($)"])[0, 1]

# Print results
plt.show()
print("Sample Correlation Coefficient:", correlation)

# q5 Relationship Between Pages Viewed and Amount Spent:
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
df = pd.read_excel("Week 5 Assignment.xlsx")
plt.figure(figsize=(10, 6))
plt.scatter(df["Pages Viewed"], df["Amount Spent ($)"])
plt.xlabel("Number of Pages Viewed")
plt.ylabel("Amount Spent ($)")
plt.title("Pages Viewed vs. Amount Spent")
plt.grid(True)
plt.show()
correlation = np.corrcoef(df["Pages Viewed"], df["Amount Spent ($)"])[0, 1]
print("Sample Correlation Coefficient:", correlation)

# q6 
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load your data
df = pd.read_excel("Week 5 Assignment.xlsx")

# Choose relevant columns
x = df["Pages Viewed"]
y = df["Time (min)"]

# Create the scatter plot
plt.figure(figsize=(8, 6))
plt.scatter(x, y)
plt.xlabel("Number of Pages Viewed")
plt.ylabel("Time Spent (min)")
plt.title("Pages Viewed vs. Time Spent")
plt.grid(True)

# Calculate the correlation coefficient
correlation = np.corrcoef(x, y)[0, 1]

# Add annotations or text based on your findings
# (e.g., correlation value, trends, etc.)

# Show the plot
plt.show()

# Print the correlation coefficient
print("Correlation Coefficient:", correlation)

