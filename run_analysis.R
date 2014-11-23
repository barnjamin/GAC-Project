

/*
    Download the file

    zippedFile <- "./uci.zip"
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zippedFile, method="curl")
    unzip(zippedFile)

    unzippedDir <- "UCI\ HAR\ Dataset"

    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
    feature_labels <- read.table("UCI HAR Dataset/features.txt")

    test_readings <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=feature_labels$V2)
    test_readings[,"activity"] <- read.table("UCI HAR Dataset/test/y_test.txt")
    test_readings[,"subject"] <- read.table("UCI HAR Dataset/test/subject_test.txt")

    training_readings <- read.table("UCI HAR Dataset/test/X_test.txt", col.names=feature_labels$V2)
    training_readings[,"activity"] <- read.table("UCI HAR Dataset/test/y_test.txt")
    training_readings[,subject"] <- read.table("UCI HAR Dataset/test/y_test.txt")

    combined <- rbind(test_readings, training_readings)

    colNames <- names(combined)
    colsWeWant <- c(colNames[grep("mean|Mean|std", names(with_labels))], "activity", "subject")
    filtered <- combined[,colsWeWant]

    with_labels <- merge(filtered, activity_labels, by.x="activity", by.y="V1")
    
    melted <- melt(with_labels, id=c("V2", "subject"), measure.vars=(names(with_labels)))

    casted <- dcast(melted, subject+V2 ~ variable,mean)

    tidy <- casted[,!(names(casted) %in% c("activity.1", "V2"))]

    write.table(tidy, "tidy.txt", row.name=FALSE)

*/




