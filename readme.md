Experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) … to know read “Readme.txt• from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Project

Create one R script called run_analysis.R that does the following.

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each

Data for de project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The dataset includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

to know read “Readme.txt• from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download  data and unzip

R Script

Load packages:  Data. Table, Dplyr, tidyr
Create working Directory

A- Merges the training and the test sets to create one data set.

Read Activity Files
Read subject files
Read feactures files
Mergin datas by row
Set names to variables
Mergin datas by columns

B- Extracts only the measurements on the mean and standard deviation for each measurement

Subset Name of Features by measurements on the mean and standard deviation
taken Names of Features with “mean()” or “std()”
Subset the Date by sletec name of Features

C- Uses descriptive activity names to name the activities in the data set

Read descriptive activity names from “activity_labels.txt


D-Appropriately labels the data set with descriptive variable names
 
In the former part, variables activity and subject and names of the activities have been labelled using descriptive names.In this part, Names of Feteatures will labelled using descriptive variable names

prefix t is replaced by time
prefix  Acc is replaced by Accelerometer
prefix  Gyro is replaced by Gyroscope
prefix f is replaced by frequency
prefix  Mag is replaced by Magnitude
prefix  BodyBody is replaced by Body

In the former part, variables activity and subject and names of the activities have been labelled using descriptive names.In this part, Names of Feteatures will labelled using descriptive variable names.

E-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each

Created a second independy tydy data set with the average of each variable for each activity and each subject based on the data set in step D

