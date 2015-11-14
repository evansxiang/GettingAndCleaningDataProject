#first download and unzip the raw zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./ProjectData.zip")
unzip("./ProjectData.zip")

#merge data
library(data.table)
library(dplyr)
library(plyr)
source("./mergeData.R")
mergeData("UCI Har Dataset")

#extract just the mean and std measurements
data <- fread("./MergedData/merged.csv")
cols <- grepl("(subject)|(activityname)|(mean\\(\\))|(std\\(\\))", colnames(data))
cols <- colnames(data)[cols]
data <- select(data, one_of(cols))
cols <- gsub("\\(|\\)", "", cols)
cols <- gsub("-","_", cols)
colnames(data) <- cols
write.csv(data, "mean_and_stdev.csv", row.names=FALSE)

#get the mean by subject and activity
data <- fread("mean_and_stdev.csv")
grouped_data <- group_by(data, subject, activityname)
summary_table <- summarize_each(grouped_data, funs(mean))
write.table(summary_table, "summary.txt", row.names=FALSE)