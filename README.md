# Getting and Cleaning Data Project
Script run_analysis.R  perform transformation of raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
into tidy data output_data.txt (described in file output_data_description.docx) .

###There are explanations of all steps from the script:

###Step 0  -  Load necessary packages
###Step 1 (optional) -  Download and unzip
Download the zip file  and store in the "file" object. Unzip the file and store in the working directory
###Step 2 - Read and subset features
Read features from file "./UCI HAR Dataset/features.txt" into data.frame and subset all rows which in the second column contains string "std()" or "mean()" (measurements on the mean and standard deviation for each measurement)
###Step 3 – Load, subset and Merge train and test data
Load train ( file "./UCI HAR Dataset/train/X_train.txt") and test (file "./UCI HAR Dataset/test/X_test.txt") data with measurements into data.frames. Subset only columns extracted in STEP 2 and merge this two data.frames into one (by rows)
Load train ( file "./UCI HAR Dataset/train/Y_train.txt"and test (file "./UCI HAR Dataset/test/Y_test.txt") data with activity into data.frames. Merge this two data.frames into one (by rows)
Load train ( file "./UCI HAR Dataset/train/subject_train.txt" and test (file "./UCI HAR Dataset/test/subject_test.txt") data with subjects into data.frames. Merge this two data.frames into one (by rows)
###Step 4 – Replace activity represented in data.frame by numbers with names.
Load file with activity names and related numbers (file "./UCI HAR Dataset/activity_labels.txt”). Using it replace activity numbers with names in the data.frame with activity data.
###Step 5 – Merge into one data.frame
Merge (by columns)  data.frames with activity, subjects, measurements into one data.frame. Set proper columns names.
###Step 6 – Aggregate
Aggregate data.frame from step 5. Group data by activity, subject. Calculate average of all measurements.  Alter names of this measurements into a new ones. 
###Step 7 – Save output
Write output from Step 6 into text file "project_result.txt"
###Step 8 – Remove all, declared  in script, new objects 
  

