mergeData <- function(dirStr) {
  #create the new directories if necessary to store merged data
  if (!file.exists("MergedData")) {
    dir.create("MergedData")
  }
  
  #combine the subject files
  fileName <- paste(dirStr, "/train/subject_train", ".txt", sep="")
  subjects <- read.table(fileName, sep="\t")
  
  fileName <- paste(dirStr, "/test/subject_test", ".txt", sep="")
  subjects <- rbind(subjects, read.table(fileName, sep="\t"))

  colnames(subjects) <- c("subject")
  write.table(subjects, "MergedData/subject.csv", row.names=FALSE)
  
  #combine the Y files
  fileName <- paste(dirStr, "/train/Y_train", ".txt", sep="")
  activities <- read.table(fileName, sep="\t")
  
  fileName <- paste(dirStr, "/test/Y_test", ".txt", sep="")
  activities <- rbind(activities, read.table(fileName, sep="\t"))
  
  colnames(activities) <- c("activity")
  write.table(activities, "MergedData/Y.csv", row.names=FALSE)
  
  #combine the X files
  featureNames <- read.table(paste(dirStr, "/features.txt", sep=""), sep=" ")
  featureNames$V1 <- as.integer(featureNames$V1)
  featureNames$V2 <- gsub("\\s", "", featureNames$V2) 
  
  fileName <- paste(dirStr, "/train/X_train", ".txt", sep="")
  features <- fread(fileName)
  
  fileName <- paste(dirStr, "/test/X_test", ".txt", sep="")
  features <- rbind(features, fread(fileName))
  
  colnames(features) <- as.vector(featureNames$V2)
  write.csv(features, "MergedData/X.csv", row.names=FALSE)
  
  data <- cbind(subjects, activities, features)
  write.csv(data, "MergedData/merged.csv", row.names=FALSE)
}