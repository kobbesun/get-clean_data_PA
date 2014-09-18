## combine test and train data

# read activity label
dfActLab <- read.csv("UCI HAR Dataset/activity_labels.txt", header = FALSE, 
                     sep = "", strip.white = TRUE)
names(dfActLab) <- c("ActivityID", "ActivityName")

# read feature names
dfFeatureNames <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, 
                           sep = "", strip.white = TRUE)
names(dfFeatureNames) <- c("ColumnID", "ColumnName")

# read training subjects
dfSubTrain <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfSubTrain) <- "SubjectID"

# read training activities
dfActTrain <- read.csv("UCI HAR Dataset/train/y_train.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfActTrain) <- "ActivityID"
dfActTrain <- merge(dfActLab, dfActTrain, by = "ActivityID")

# read training data set
dfSetTrain <- read.csv("UCI HAR Dataset/train/X_train.txt", header = FALSE, 
                       sep = "", strip.white = TRUE)
names(dfSetTrain) <- dfFeatureNames$ColumnName

# import data.table package to filter mean and std measurements (features)
library(data.table)

# keep only mean and std measurements
dfSetTrainMS <- dfSetTrain[, dfFeatureNames$ColumnName %like% "*mean*" | 
                             dfFeatureNames$ColumnName %like% "*std*"]
# release dfSetTrain to free some RAM
remove(dfSetTrain)

# combiine training subjects, activities and data set
ID <- 1:7352
DataSource <- rep("train", 7352)
dfSetTrainAll <- cbind(ID, DataSource, dfSubTrain, dfActTrain, dfSetTrainMS)

# release dfSubTrain, dfActionTrain, dfSetTrainMS to free some RAM
remove(dfSubTrain)
remove(dfActTrain)
remove(dfSetTrainMS)


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
# release dfSetTrain to free some RAM
remove(dfSetTest)

# combiine test subjects, activities and data set
ID <- 7353:(7352 + 2947)
DataSource <- rep("test", 2947)
dfSetTestAll <- cbind(ID, DataSource, dfSubTest, dfActTest, dfSetTestMS) 

# release dfSubTest, dfActionTest, dfSetTestMS, dfActLab, dfFeatureNames to free some RAM
remove(dfSubTest)
remove(dfActTest)
remove(dfSetTestMS)
remove(dfActLab)
remove(dfFeatureNames)

# combine two data frame
dfSetAll <- rbind(dfSetTrainAll, dfSetTestAll)

# remove dfSetTrainAll and dfSetTestAll to free some RAM
remove(dfSetTrainAll) 
remove(dfSetTestAll)

# creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

dfSetMean <- aggregate(. ~ SubjectID + ActivityName, data = dfSetAll, mean)

# drop columns ID and Datasource
dfSetMean$ID <- NULL
dfSetMean$DataSource <- NULL

# output final data to csv file
write.csv(dfSetMean, file = paste("step5_output_", Sys.time(),
                                 ".csv",sep = ""), row.names = FALSE)


# clear dfSetAll, dfSetMean, ID, and DataSource in current environment
remove(dfSetAll)
remove(dfSetMean)
remove(ID)
remove(DataSource)

## end
