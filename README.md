# Class 3 final project

## The project is aimed to clean and reshape a data package from UCI Machine Learning Repository
    # The data is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors
    # The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
    # Data source: 
        Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
        1 - Smartlab - Non-Linear Complex Systems Laboratory
        DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
        2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
        Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
        activityrecognition '@' smartlab.ws
    
    # The run_analysis.R will read dataset from the UCI database and automatically output 2 tidy datasets    
        # tidy_dataset1 contains the information of subject, activity and 79 more of the mean and standard deviation of the measurements
          the dataset also combines the test and train data 
        # tidy_dataset2 is the reshaped form of tidy_dataset1, which is an independent tidy data set with the average of each variable for each activity and each subject. 
