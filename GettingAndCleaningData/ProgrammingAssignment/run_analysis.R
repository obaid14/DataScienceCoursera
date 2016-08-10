library(reshape2)
library(dplyr)

# loading in required data
sub_test <- read.table("./ProgrammingAssignment/UCI HAR Dataset/test/subject_test.txt")
sub_train <- read.table("./ProgrammingAssignment/UCI HAR Dataset/train/subject_train.txt")

data_test <- read.table("./ProgrammingAssignment/UCI HAR Dataset/test/X_test.txt")
data_train <- read.table("./ProgrammingAssignment/UCI HAR Dataset/train/X_train.txt")

label_test <- read.table("./ProgrammingAssignment/UCI HAR Dataset/test/Y_test.txt")
label_train <- read.table("./ProgrammingAssignment/UCI HAR Dataset/train/Y_train.txt")

features <- read.table("./ProgrammingAssignment/UCI HAR Dataset/features.txt")
activitylabel <- read.table("./ProgrammingAssignment/UCI HAR Dataset/activity_labels.txt")
names(activitylabel)[2] <- "ActivityLabel"

# combine test and train for x
data_train.test <- rbind(data_train,data_test)

#use descriptive names (#4)
names(data_train.test) <- as.character(features[, 2])

# combine test and train for y
label_train.test <- rbind(label_train,label_test)
names(label_train.test)[1] <- "ActivityLabelID"

# combine test and train for subject
sub_train.test <- rbind(sub_train,sub_test)
names(sub_train.test)[1] <- "Subject"


# extracts only mean and std for each measurement
# fetch all mean and sd column (#2)
meanstd <- c(grep("mean()",colnames(data_train.test),fixed=TRUE),grep("std()",colnames(data_train.test),fixed=TRUE))
data_train.test.mean.std <- data_train.test[, meanstd]

# descriptive activity names (#3)
label_train.test.activity <- merge(label_train.test,activitylabel, by=1)

# create one dataset (#1)
merged <- cbind(sub_train.test, label_train.test.activity, data_train.test.mean.std)

# Creates a second, independent tidy data set 
# average of each variable for each activity and each subject.
# (#5)
filtered = melt(merged, id.var = c("ActivityLabelID", "ActivityLabel", "Subject"))
tidy_data = dcast(filtered , Subject + ActivityLabel ~ variable, mean)

write.table(tidy_data, file="./ProgrammingAssignment/TidyData.txt", sep=";", row.names=FALSE)