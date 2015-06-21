# Coursera Getting and Cleaning Data Course Project

## Prereqs
1. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to the script's folder;
2. Unzip the file;
3. Run run_analysis.R script.

## How the Script works:
1. All train and test files are loaded in memory;
2. The subject, activity and features for train data are merged into one data.frame;
3. The subject, activity and features for test data are merged into one data.frame;
4. train data and test data are merged together;
5. Only the data about mean and standard deviation are selected;
6. The average of each variable for each activity and each subject are calculated and saved to a file named "subject_activity_mean.txt".
