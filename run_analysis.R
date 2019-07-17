##########################

# run_analysis.R

# OVERVIEW

# Using data collected from the SAMSUNG smart phone,
# clean the data and work with it to make a clean tidy data set.
# More details, read README.md

library(dplyr)

# Extract data from the zip file

filename <- "dataset.zip"
if(!file.exists(filename)){
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl, filename)
}
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

# Read data from the files

subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
values_train <- read.table("UCI HAR Dataset/train/X_train.txt")
activities_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
values_test <- read.table("UCI HAR Dataset/test/X_test.txt")
activities_test <- read.table("UCI HAR Dataset/test/y_test.txt")

features <- read.table("UCI HAR Dataset/features.txt", as.is = TRUE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

names(activities) <- c("activityID", "activityName")

# 1. Merges the training and the test sets to create one data set.

mergedData <- rbind(cbind(subjects_train, values_train, activities_train), cbind(subjects_test, values_test, activities_test))

names(mergedData) <- c("subject", features[,2],"activity")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

filteredData <- mergedData[, grepl("subject|activity|mean\\(|std", names(mergedData))]

# 3. Uses descriptive activity names to name the activities in the data set

filteredData <- merge(filteredData, activities, by.x = "activity", by.y = "activityID")
filteredData %>% select(-activity)

# 4. Appropriately labels the data set with descriptive variable names

colnames <- names(filteredData)
colnames <- gsub("^t", "Time Domain ", colnames)
colnames <- gsub("^f", "Frequency Domain ", colnames)
colnames <- gsub("Acc", " Accelerator ", colnames)
colnames <- gsub("Gyro", " Gyroscope ", colnames)
colnames <- gsub("Mag", " Magnitude", colnames)
colnames <- gsub("-mean\\()", " Mean", colnames)
colnames <- gsub("-std\\()", " Standard Deviation", colnames)
colnames <- gsub("BodyBody", "Body", colnames)
colnames <- gsub("  ", " ", colnames)
names(filteredData) <- colnames

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyData <- filteredData %>% group_by(subject, activityName) %>% summarise_each(mean)

write.table(tidyData, "tidyData.txt", row.names = FALSE, quote = FALSE, sep = "\t")
