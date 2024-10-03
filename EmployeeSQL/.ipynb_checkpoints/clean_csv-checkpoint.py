import pandas as pd

# Load the CSV file
df = pd.read_csv('data/dept_emp.csv')

# Remove duplicates based on 'emp_no', keeping the first occurrence
df_cleaned = df.drop_duplicates(subset='emp_no', keep='first')

# Save the cleaned DataFrame to a new CSV file
df_cleaned.to_csv('path/to/your/cleaned_dept_emp.csv', index=False)

print("Duplicates removed and cleaned file saved.")

df_cleaned.head()