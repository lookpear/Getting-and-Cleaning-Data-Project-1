# Getting-and-Cleaning-Data-Project-1
##The run_analysis.R script has been written with the following concepts.
1. Read the activity_labels and features files from the saved directory and select only columns of Mean and STD in features file
2. For test data, 
   - Read test data from subject_test, X_test, and y_test and select only Mean and STD columns from X_test table
   - Merge all data together and name as Test_table
3. For train data, 
   - Read train data from subject_train, X_train, and y_train and select only Mean and STD columns from X_train table
   - Merge all data together and name as Train_table
4. Appropriately labeling the selected features with descriptive variable names
5. Merge Train_table and Test_table together and name as Merge_table and assign column name
6. Uses descriptive activity names to name the activities in the Merge_table
7. Average all variables for each subject and each activity and write table "tidy_data.txt"
