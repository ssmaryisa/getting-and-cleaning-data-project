# Getting and Cleaning Data Project

This repository hosts the R code and documentation for the Data Science's track course "Getting and Cleaning data", available in coursera.

## Files

This repo hosts CodeBook.md, tidydata.txt and run_analysis.R.

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

run_analysis.R contains all the code to perform the analyses described in the 5 steps. The R script, run_analysis.R, does the following:

1. Gets the data and put in data directory
2. Unzips the dataset.zip archive
3. Reads and merges the activity, subject and feature datas
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive variable names.
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. The end result is shown in the file tidydata.txt.




