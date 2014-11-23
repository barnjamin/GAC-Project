# Download & unzip the file
dlFile <- function() {
    zippedFile <- "./uci.zip"
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zippedFile, method="curl")
    unzip(zippedFile)
}

# Run steps to combine and perform calculations on the data 
run_analysis <- function(){

    #Get the activity labels and feature labels
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    feature_labels <- read.table("UCI HAR Dataset/features.txt")

    #Read in test and training data sets, joining the activity ids and subject ids on the left side
    test_readings <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=feature_labels$V2)
    test_readings[,"activity"] <- read.table("UCI HAR Dataset/test/y_test.txt")
    test_readings[,"subject"] <- read.table("UCI HAR Dataset/test/subject_test.txt")

    training_readings <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=feature_labels$V2)
    training_readings[,"activity"] <- read.table("UCI HAR Dataset/test/y_test.txt")
    training_readings[,"subject"] <- read.table("UCI HAR Dataset/test/y_test.txt")

    # Create a combined list of both data sets 
    combined <- rbind(test_readings, training_readings)

    #Get the list of column names, pull out any coulmns that contain the words mean,Mean, or std 
    colNames <- names(combined)
    colsWeWant <- c(colNames[grep("mean|Mean|std", names(combined))], "activity", "subject")
    filtered <- combined[,colsWeWant]

    #Add in activity labels by joining on the activity labels table
    with_labels <- merge(filtered, activity_labels, by.x="activity", by.y="V1")

    #Make sure you have this installed... if not just install.packages("reshape2")
    library(reshape2)

    #Create a melted data set with V2 being the activity label and subject being the subject ID
    melted <- melt(with_labels, id=c("V2", "subject"), measure.vars=(names(with_labels)))

    #Make sure we're working with numbers
    melted$value <- as.numeric(melted$value)

    #Create a new table that generates an average for every subject and activity label against the features
    casted <- dcast(melted, subject+V2 ~ variable,mean)

    # Filter out a coulple of the extra columns 
    tidy <- casted[,!(names(casted) %in% c("activity.1", "subject.1", "V2"))]

    #Finally, write out the tidy data set to a file to be uploaded 
    write.table(tidy, "tidy.txt", row.name=FALSE)

}
