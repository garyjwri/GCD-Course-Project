# Code Book

## Description of the raw data

We use the Human Activity Recognition Using Smartphones Dataset by Jorge L. Reyes-Ortiz et al, downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Read the experiment description below.

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

From this, they calculated a set of 'features', according to the following method.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Variables included in the final dataset

The variables that were calculated are as follows:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The original dataset contains many aspects of each of the above signals making the total variable count 561. For our purposes, however, we use only the mean and the standard deviation. Keep in mind that a variable such as tBodyAcc-XYZ actually comprises 3 columns, namely tBodyAcc-X, tBodyAcc-Y, tBodyAcc-Z, corresponding to its values in the three axes. There are 8 such variables, meaning there are a total of 3\*8+9=33 distinct signals, and for each we include the mean and the standard deviation, making the total number of columns 66.

For example, tBodyAcc-mean()-X indicates that it is the mean of the tBodyAcc in the x direction, while tBodyAcc-std()-X is the standard deviation in the same signal. All other variables are named analogously.
The first and second columns encode the subject (1~30) and the activity (walking, walking upstairs, walking downstairs, sitting, standing, laying).

The raw dataset, however, contains many observations for each subject doing a given activity (an average of 57 observations per subject per activity). The final dataset produced by run_analysis.R reports only the **mean** value of those observations. Therefore the column names are
* Mean of tBodyAcc-mean()-X
* Mean of tBodyAcc-mean()-Y
* Mean of tBodyAcc-mean()-Z
* Mean of tBodyAcc-std()-X
* Mean of tBodyAcc-std()-Y
* Mean of tBodyAcc-std()-Z
* and so on

To reiterate, we give the mean of the mean and the mean of the standard deviation for each of the 33 signals for the 180 subject-activity pairs. Adding the two columns that label the subject and the column, this gives a tidy dataset of 180 rows and 68 columns (66+2).
