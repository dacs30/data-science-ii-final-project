# open predict_sleep_efficiency.py
# Path: predict_sleep_efficiency.py

import pandas as pd

# Read the data
df = pd.read_csv('predicted_sleep_efficiency.csv')

# get all columns that have predicted_sleep_efficiency as a column name or Sleep.efficiency
df = df.filter(regex='predicted_sleep_efficiency')

# loop each predicted_sleep_efficiency[value] and find the column with the highest value
for index, row in df.iterrows():
    # get the index of the max value
    max_index = row.idxmax()
    # get the value of the max value
    max_value = row.max()
    # get the column name of the max value
    max_column = max_index.split('.')[1] + '.' + max_index.split('.')[2]
    # print the column name and the value
    print(max_column, max_value)
    # add the column name and the value to the dataframe
    df.loc[index, 'best_predicted_sleep_efficiency'] = max_column
    df.loc[index, 'best_predicted_sleep_efficiency_confience'] = max_value

# save the dataframe to a csv file
df.to_csv('predicted_sleep_efficiency_processed.csv', index=False)