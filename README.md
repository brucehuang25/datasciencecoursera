# Class 3 final project

## Object
The project is aimed to clean and reshape a data package from UCI Machine Learning Repository

The data is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data


## Data source: 
        Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
        1 - Smartlab - Non-Linear Complex Systems Laboratory
        DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
        2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
        Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
        activityrecognition '@' smartlab.ws
    
## Output: 
The run_analysis.R will read dataset from the UCI database and automatically output one tidy dataset    
    tidy_dataset1 contains the information of subject, activity and 79 more of the mean and standard deviation of the measurements
          the dataset also combines the test and train data 

## Analysis Process

### 1 - Merges the training and the test sets to create one data set
library(dplyr)

x_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")

x_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")

activity_label = read.table("UCI HAR Dataset/activity_labels.txt")
features = read.table("UCI HAR Dataset/features.txt")

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")

data_subject =rbind(subject_test,subject_train)
data_activity = rbind(y_test,y_train)

data_test = cbind(x_test)
data_train = cbind(x_train)
dataset = rbind(data_test,data_train)

### 2 - Extracts only the measurements on the mean and standard deviation for each measurement

mean_sd = grep("mean|std",features$V2)

dataset_meansd = dataset[,mean_sd]


### 3 - Uses descriptive activity names to name the activities in the data set

activity_group = factor(dataset_new$Activity)

levels(activity_group) = activity_label[,2]

dataset_new$Activity = activity_group

tidy_dataset1 = dataset_new


### 4 - Appropriately labels the data set with descriptive variable name

colnames(dataset_meansd) = features$V2[mean_sd]

dataset_meansd$Subject = data_subject[,1]

dataset_meansd$Activity = data_activity[,1]

dataset_new = dataset_meansd


### 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject

library(reshape2)

dataset_ave = melt(dataset_new,id.vars = c("Subject","Activity"))

dataset2 = dcast(dataset_ave, Subject + Activity ~ variable, mean)

tidy_dataset2 = dataset2
