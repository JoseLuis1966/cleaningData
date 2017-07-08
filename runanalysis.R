# Load the needed packages

library(data.table)
library(dplyr)
library(tidyr)

##working directory 

setwd("C:\\Users\\NACHO\\Documents\\cursoR\\cleaning data\\project\\UCI HAR Dataset\\")
getwd()

##  Merges the training and the test sets to create one data set.

#Read Activity Files

dataActivityTrain <- read.table("train/y_train.txt", header = FALSE)
dataActivityTest  <- read.table("test/y_test.txt", header = FALSE)

#Read the subject files

datasubjectTrain <- read.table("train/subject_train.txt", header= FALSE)
datasubjectTest <- read.table("test/subject_test.txt", header= FALSE)

#Read a features files

datafeaturestrain <- read.table("train/X_train.txt", header = FALSE)
datafeaturestext <- read.table("test/X_test.txt", header = FALSE)

### Merging datas 

#concatenate the data tables by rows

dataSubject <- rbind (datasubjectTrain,datasubjectTest)
dataActivity <- rbind (dataActivityTrain,dataActivityTest)
dataFeatures <- rbind (datafeaturestrain,datafeaturestext)

#Set naemes to variables

names (dataSubject) <- c("subject")
names (dataActivity) <- c ("activity")
dataFeaturesNames <- read.table("features.txt", header = FALSE)
names(dataFeatures) <- dataFeaturesNames$V2

# Merge columns to get all data in one set

dataCombine <- cbind(dataSubject,dataActivity)
Data <- cbind(dataFeatures,dataCombine)

## Extracts only the measurements on the mean and standard deviation for each measurement

#Subset Name of Features by measurements on the mean and standard deviation
# taken Names of Features with "mean()" or "std()"

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

#Subset the Date by sletec name of Features

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

##Uses descriptive activity names to name the activities in the data set

#Read descriptive activity names from "activity_labels.txt"

activityLabels <- read.table("activity_labels.txt", header = FALSE)

##Appropriately labels the data set with descriptive variable names

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

##- creates a second, independent tidy data set with the average of each variable for each

Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "Secondtidydata.txt",row.name=FALSE)



