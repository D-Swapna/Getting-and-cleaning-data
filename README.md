---
title: "Getting and cleaning data course project"
author: "Swapna"
date: "7/17/2019"
output: html_document
---




This repository contains the following files :

1. README.md - Contains details about the project
2. run_analsysi.R - Contains the script used to work with the data and create a tidy data set
3. CodeBook.md - Describes the content of the dataset (variables and transformations)
4. tidyData.txt - Contains the tidy data set obtained after working with the given data.

## Creating the data set

The script 'run_analysis.R' is used to extract the data and transform the data to produce the final data set.
For details about the final data set, refer 'CodeBook.md'

1. Unzip the data.
2. Read the data.
3. Merge the training data and test data to one data set.
4. Extract only the measurements on mean and standard deviation from the data set.
5. Use descriptive activity names in the activities column of the data set.
6. Use descriptive labels for the variables in the data set.
7. Create a new dataset with average of each variable for each subject and activity.
8. Write the new dataset to a file 'tidyData.txt'
