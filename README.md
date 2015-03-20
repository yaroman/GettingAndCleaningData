##Getting and Cleaning Data Project

This repository cotains the following files:
- run_analysis.R
- CodeBook.md
- cleanData.txt
- README.md

The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

This is a link to the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data should be downloaded and unzipped into the "./data/UCI_HAR_Dataset" folder of your working directory.

The script "run_analysis.R"" will read in the necessary data, process, and output the tidy dataset in the file ./data/cleanData.txt.

These are the steps the script executes:
1. Reads files in.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set.
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The "CodeBook.md" files explains all transformations in more details


