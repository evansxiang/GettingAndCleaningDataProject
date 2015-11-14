#first download and unzip the raw zip file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./ProjectData.zip")
unzip("./ProjectData.zip")

#merge data
library(data.table)
source("./mergeData.R")
mergeData("UCI Har Dataset")
