GAC-Project
===========

Project repo for Getting and Cleaning Data course project


"run_analysis" function requires that data is unzipped and in working directory.  
There is a convenience function that will download and unzip the files 

Files are pulled from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The dataset this generates is a table of values that represent the average of all the 
average or stddeviation columns from the source data set by subject and activitiy. 

The source columns are well documented in the link provided so I wont reproduce the same documentation here but the first two columns are not documented.

"subject" is the id of the person performing the activities
"activity" is the activity performed

