# Run Analysis R Script
# By: Fillipe Massuda

library(reshape2)

# features set to name the columns
features_set <- read.table("./UCI HAR Dataset/features.txt", col.names = c("id", "feature"))

# read train set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(x_train) <- features_set$feature

# read test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
y_test <- read.table("./UCI HAR Dataset/test//y_test.txt", col.names = "activity")
x_test <- read.table("./UCI HAR Dataset/test//X_test.txt")
names(x_test) <- features_set$feature

#activity labels set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity_label"))

# merge train set
train_set <- cbind(subject_train, y_train, x_train)

# merge test set
test_set <- cbind(subject_test, y_test, x_test)

# merge train + test
har_dataset <- rbind(train_set, test_set)

# Select the mean and standard deviation fields
har_mean_sd <- har_dataset[, c(1,2,grep("mean()", names(har_dataset), fixed = T), grep("std()", names(har_dataset), fixed = T))]

# descriptive activity labels
har_mean_sd$activity <- factor(har_mean_sd$activity, labels=c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# Calculate the average per subject and activity
har_melt <- melt(har_mean_sd, id=c("subject", "activity"))
tidy_har <- dcast(har_melt, subject+activity ~ variable, mean)

# Generate the file
write.table(tidy_har, "subject_activity_mean.txt", row.names=FALSE)
