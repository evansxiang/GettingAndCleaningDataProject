# Getting and Cleaning Data Course Project

run_analysis.R is the main script that runs everything.

* It first downloads the file to the current directory and named ProjectData.zip
* The mergeData() function merges all the data and puts them in the MergedData directory, the merged.csv contains everything combined together
* We then extract just the mean and standard deviation measurements and save that into mean_and_stdev.csv
* Finally, we summarize the mean for each subject and activity and savet the result to summary.txt