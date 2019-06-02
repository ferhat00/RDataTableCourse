Here is the submission for the course project for the Getting and Cleaning Data Coursera course on Coursera, John Hopkins.

This includes:
R script, run_analysis.R, conducts the following:


The run_analysis.R files does the following:
- Gets the data from txt and using data tables package imports the data into R.
- Both the train and test datasets are then merged into X_test/train, y_test/train and subject_test/train.
- Loads feature, activity info and extracts the column that contain the mean and standard deviation. 
- Extracts the data by the selected columns and then merges x, y and subject_data.
- Generates 'tidy data' which contains the mean of each variable for each subject and each activity. 
- Output file is tidy_dataset.txt.
