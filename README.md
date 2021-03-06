# Getting and Cleaning Data Course Project
SUN Lei  
09/18/2014  

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerators from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


As per project requirements, I create one R script called run_analysis.R that does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

I first download data to working directory and extract it to folder ```./UCI HAR Dataset```. After reading the introduction, I realize the information of activity labels, feature (measurement) names and data, training and testing subjects are stored in seperate files. Therefore I have to import them one by one to R.

Read activity label.

```r
dfActLab <- read.csv("UCI HAR Dataset/activity_labels.txt", header = FALSE, 
                     sep = "", strip.white = TRUE)
names(dfActLab) <- c("ActivityID", "ActivityName")
```

```
##   ActivityID       ActivityName
## 1          1            WALKING
## 2          2   WALKING_UPSTAIRS
## 3          3 WALKING_DOWNSTAIRS
## 4          4            SITTING
## 5          5           STANDING
## 6          6             LAYING
```
Read feature names.

```r
dfFeatureNames <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, 
                           sep = "", strip.white = TRUE)
names(dfFeatureNames) <- c("ColumnID", "ColumnName")
```

```
##   ColumnID        ColumnName
## 1        1 tBodyAcc-mean()-X
## 2        2 tBodyAcc-mean()-Y
## 3        3 tBodyAcc-mean()-Z
## 4        4  tBodyAcc-std()-X
## 5        5  tBodyAcc-std()-Y
## 6        6  tBodyAcc-std()-Z
```
... ...

```
##     ColumnID                           ColumnName
## 556      556 angle(tBodyAccJerkMean),gravityMean)
## 557      557     angle(tBodyGyroMean,gravityMean)
## 558      558 angle(tBodyGyroJerkMean,gravityMean)
## 559      559                 angle(X,gravityMean)
## 560      560                 angle(Y,gravityMean)
## 561      561                 angle(Z,gravityMean)
```
Read training subjects

```r
dfSubTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfSubTrain) <- "SubjectID"
```

```
##      SubjectID
## 1            1
## 348          3
## 689          5
## 991          6
## 1316         7
## 1624         8
## 1905        11
## 2221        14
## 2544        15
## 2872        16
## 3238        17
## 3606        19
## 3966        21
## 4374        22
## 4695        23
## 5067        25
## 5476        26
## 5868        27
## 6244        28
## 6626        29
## 6970        30
```
Read training activities

```r
dfActTrain <- read.csv("UCI HAR Dataset/train/y_train.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfActTrain) <- "ActivityID"
dfActTrain <- merge(dfActLab, dfActTrain, by = "ActivityID")
```

```
##      ActivityID       ActivityName
## 1             1            WALKING
## 1227          2   WALKING_UPSTAIRS
## 2300          3 WALKING_DOWNSTAIRS
## 3286          4            SITTING
## 4572          5           STANDING
## 5946          6             LAYING
```
Read training data set

```r
dfSetTrain <- read.csv("UCI HAR Dataset/train/X_train.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfSetTrain) <- dfFeatureNames$ColumnName

# the dfStetTrain is too big to list below
```
Keep only mean and std measurements

```r
# import data.table package to filter mean and std measurements (features)
library(data.table)
dfSetTrainMS <- dfSetTrain[, dfFeatureNames$ColumnName %like% "*mean*" | 
                             dfFeatureNames$ColumnName %like% "*std*"]
```
Combine training subjects, activities and data set

```r
ID <- 1:7352
DataSource <- rep("train", 7352)
dfSetTrainAll <- cbind(ID, DataSource, dfSubTrain, dfActTrain, dfSetTrainMS)
```
The ```dfSetTrainAll``` data frame contains 80+ measurement columns and 7k+ records.

I adopt the exactly same method to process Test data set.

```r
# read test subjects
dfSubTest <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfSubTest) <- "SubjectID"

# read test activities
dfActTest <- read.csv("UCI HAR Dataset/test/y_test.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfActTest) <- "ActivityID"
dfActTest <- merge(dfActLab, dfActTest, by = "ActivityID")

# read test data set
dfSetTest <- read.csv("UCI HAR Dataset/test/X_test.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfSetTest) <- dfFeatureNames$ColumnName

# keep only mean and std measurements
dfSetTestMS <- dfSetTest[, dfFeatureNames$ColumnName %like% "*mean*" | 
                                   dfFeatureNames$ColumnName %like% "*std*"]

# combiine test subjects, activities and data set
ID <- 7353:(7352 + 2947)
DataSource <- rep("test", 2947)
dfSetTestAll <- cbind(ID, DataSource, dfSubTest, dfActTest, dfSetTestMS) 
```
The ```dfSetTestAll``` data frame contains 80+ measurement columns and nearly 3k records. 

Combine the processed train and test data.

```r
dfSetAll <- rbind(dfSetTrainAll, dfSetTestAll)
```
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

```r
dfSetMean <- aggregate(. ~ SubjectID + ActivityName, data = dfSetAll, mean)
```

Output final data to csv file

```r
write.csv(dfSetMean, file = paste("step5_output_", Sys.time(),
                                 ".csv",sep = ""), row.names = FALSE)
```
The outcome final csv data file can be downloaded [here](https://github.com/kobbesun/get-clean_data_PA/blob/master/step5_output2014-09-17%2016:57:36.csv), and the Codebook of which can be found [here](https://github.com/kobbesun/get-clean_data_PA/blob/master/CodeBook.md).



~ This is the end of README in my "Getting and Cleaning Data Course Project". ~



