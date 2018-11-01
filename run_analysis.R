library(dplyr)

# Read data from local files
x_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")

x_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")

activity_label = read.table("UCI HAR Dataset/activity_labels.txt")
features = read.table("UCI HAR Dataset/features.txt")

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")


# 1 - Merges the training and the test sets to create one data set

data_subject =rbind(subject_test,subject_train)
data_activity = rbind(y_test,y_train)

data_test = cbind(x_test)
data_train = cbind(x_train)
dataset = rbind(data_test,data_train)


# 2 - Extracts only the measurements on the mean and standard deviation for each measurement
mean_sd = grep("mean|std",features$V2)
dataset_meansd = dataset[,mean_sd]


# 4 - Appropriately labels the data set with descriptive variable name
colnames(dataset_meansd) = features$V2[mean_sd]
dataset_meansd$Subject = data_subject[,1]
dataset_meansd$Activity = data_activity[,1]

dataset_new = dataset_meansd


# 3 - Uses descriptive activity names to name the activities in the data set
activity_group = factor(dataset_new$Activity)
levels(activity_group) = activity_label[,2]
dataset_new$Activity = activity_group
tidy_dataset1 = dataset_new


# 5 - Creates a second, independent tidy data set with the average of 
    # each variable for each activity and each subject
library(reshape2)
dataset_ave = melt(dataset_new,id.vars = c("Subject","Activity"))
dataset2 = dcast(dataset_ave, Subject + Activity ~ variable, mean)
tidy_dataset2 = dataset_2


