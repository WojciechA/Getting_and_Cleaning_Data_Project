#Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been aggregated: a mean of all rows with mean and standard deviation has been calculate for each activity and subject.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


##Attribute Information:
For each record in the dataset it is provided 
- mean of all collected mean and standard deviation of: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. - in standard gravity units 'g'
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

###The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

###In the next step the average of each variable for each activity and each subject has been calculated

##Notes: 
- Features are normalized and bounded within [-1,1].

##The complete list of variables of each feature vector :

* activity
* Subject_nr
* avg_of(tBodyAcc-mean()-X)
* avg_of(tBodyAcc-mean()-Y)
* avg_of(tBodyAcc-mean()-Z)
* avg_of(tBodyAcc-std()-X)
* avg_of(tBodyAcc-std()-Y)
* avg_of(tBodyAcc-std()-Z)
* avg_of(tGravityAcc-mean()-X)
* avg_of(tGravityAcc-mean()-Y)
* avg_of(tGravityAcc-mean()-Z)
* avg_of(tGravityAcc-std()-X)
* avg_of(tGravityAcc-std()-Y)
* avg_of(tGravityAcc-std()-Z)
* avg_of(tBodyAccJerk-mean()-X)
* avg_of(tBodyAccJerk-mean()-Y)
* avg_of(tBodyAccJerk-mean()-Z)
* avg_of(tBodyAccJerk-std()-X)
* avg_of(tBodyAccJerk-std()-Y)
* avg_of(tBodyAccJerk-std()-Z)
* avg_of(tBodyGyro-mean()-X)
* avg_of(tBodyGyro-mean()-Y)
* avg_of(tBodyGyro-mean()-Z)
* avg_of(tBodyGyro-std()-X)
* avg_of(tBodyGyro-std()-Y)
* avg_of(tBodyGyro-std()-Z)
* avg_of(tBodyGyroJerk-mean()-X)
* avg_of(tBodyGyroJerk-mean()-Y)
* avg_of(tBodyGyroJerk-mean()-Z)
* avg_of(tBodyGyroJerk-std()-X)
* avg_of(tBodyGyroJerk-std()-Y)
* avg_of(tBodyGyroJerk-std()-Z)
* avg_of(tBodyAccMag-mean())
* avg_of(tBodyAccMag-std())
* avg_of(tGravityAccMag-mean())
* avg_of(tGravityAccMag-std())
* avg_of(tBodyAccJerkMag-mean())
* avg_of(tBodyAccJerkMag-std())
* avg_of(tBodyGyroMag-mean())
* avg_of(tBodyGyroMag-std())
* avg_of(tBodyGyroJerkMag-mean())
* avg_of(tBodyGyroJerkMag-std())
* avg_of(fBodyAcc-mean()-X)
* avg_of(fBodyAcc-mean()-Y)
* avg_of(fBodyAcc-mean()-Z)
* avg_of(fBodyAcc-std()-X)
* avg_of(fBodyAcc-std()-Y)
* avg_of(fBodyAcc-std()-Z)
* avg_of(fBodyAccJerk-mean()-X)
* avg_of(fBodyAccJerk-mean()-Y)
* avg_of(fBodyAccJerk-mean()-Z)
* avg_of(fBodyAccJerk-std()-X)
* avg_of(fBodyAccJerk-std()-Y)
* avg_of(fBodyAccJerk-std()-Z)
* avg_of(fBodyGyro-mean()-X)
* avg_of(fBodyGyro-mean()-Y)
* avg_of(fBodyGyro-mean()-Z)
* avg_of(fBodyGyro-std()-X)
* avg_of(fBodyGyro-std()-Y)
* avg_of(fBodyGyro-std()-Z)
* avg_of(fBodyAccMag-mean())
* avg_of(fBodyAccMag-std())
* avg_of(fBodyBodyAccJerkMag-mean())
* avg_of(fBodyBodyAccJerkMag-std())
* avg_of(fBodyBodyGyroMag-mean())
* avg_of(fBodyBodyGyroMag-std())
* avg_of(fBodyBodyGyroJerkMag-mean())
* avg_of(fBodyBodyGyroJerkMag-std()) 

