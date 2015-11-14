#first download and unzip the raw zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./ProjectData.zip")
unzip("./ProjectData.zip")

#merge data
library(data.table)
source("./mergeData.R")
mergeData("UCI Har Dataset")

#extract just the mean and std measurements
library(dplyr)
data <- fread("./MergedData/merged.csv")
cols <- grepl("(subject)|(activityname)|(mean\\(\\))|(std\\(\\))", colnames(data))
cols <- colnames(data)[cols]
data <- select(data, one_of(cols))
write.csv(data, "mean_and_stdev.csv", row.names=FALSE)
