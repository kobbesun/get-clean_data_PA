# CodeBook of Getting and Cleaning Data Course Project Outcome Data Set 
SUN Lei  
09/18/2014  

### Background Information

The data adopted is from "Human Activity Recognition Using Smartphones Dataset", which is the experiment outcome produced by

>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto in
>Smartlab - Non Linear Complex Systems Laboratory at
>DITEN - Università degli Studi di Genova.
>Via Opera Pia 11A, I-16145, Genoa, Italy.
>activityrecognition@smartlab.ws
>www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). Thereform there are 128 numbers record at each window. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Features/ Measurements
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

A set variables that were estimated from these signals but in this course we are only interested in ```mean(): Mean value``` and ```std(): Standard deviation```. Therefore the list of features are:

```
##  [1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
##  [3] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
##  [5] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
##  [7] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
##  [9] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
## [11] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
## [13] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
## [15] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
## [17] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
## [19] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
## [21] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
## [23] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
## [25] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
## [27] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
## [29] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
## [31] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
## [33] "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
## [35] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
## [37] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
## [39] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
## [41] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
## [43] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"               
## [45] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
## [47] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
## [49] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
## [51] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
## [53] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
## [55] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"      
## [57] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
## [59] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
## [61] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
## [63] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
## [65] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
## [67] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
## [69] "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
## [71] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
## [73] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
## [75] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"    
## [77] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
## [79] "fBodyBodyGyroJerkMag-meanFreq()"
```
Becasue the final outcome data is the average of each variable (feature/measurement) for each activity and each subject, a typical record in this outcome data set would be like:

```
##   SubjectID ActivityName ActivityID tBodyAcc-mean()-X tBodyAcc-mean()-Y
## 1        20       LAYING          6            0.2682          -0.01544
##   tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z
## 1           -0.1034          -0.5465           -0.259          -0.6397
##   tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z
## 1                0.591             0.002436               0.1078
##   tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
## 1              -0.958             -0.9511             -0.9437
##   tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
## 1               0.07503             -0.002744             -0.002515
##   tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
## 1              -0.5862              -0.4261              -0.7389
##   tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
## 1           -0.02247           -0.07896            0.09003
##   tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
## 1           -0.6524           -0.4859           -0.4608
##   tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
## 1               -0.09455                -0.0402               -0.05257
##   tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
## 1               -0.6532               -0.6436               -0.5369
##   tBodyAccMag-mean() tBodyAccMag-std() tGravityAccMag-mean()
## 1            -0.4524            -0.519               -0.4524
##   tGravityAccMag-std() tBodyAccJerkMag-mean() tBodyAccJerkMag-std()
## 1               -0.519                -0.5646               -0.5408
##   tBodyGyroMag-mean() tBodyGyroMag-std() tBodyGyroJerkMag-mean()
## 1             -0.4351            -0.5215                 -0.6246
##   tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y
## 1                -0.6531           -0.5706            -0.325
##   fBodyAcc-mean()-Z fBodyAcc-std()-X fBodyAcc-std()-Y fBodyAcc-std()-Z
## 1            -0.672          -0.5386          -0.2739          -0.6509
##   fBodyAcc-meanFreq()-X fBodyAcc-meanFreq()-Y fBodyAcc-meanFreq()-Z
## 1               -0.2735               0.04039               0.09643
##   fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
## 1               -0.6245                -0.467               -0.7308
##   fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z
## 1              -0.5841              -0.4204              -0.7457
##   fBodyAccJerk-meanFreq()-X fBodyAccJerk-meanFreq()-Y
## 1                   -0.1408                   -0.2702
##   fBodyAccJerk-meanFreq()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y
## 1                   -0.1711            -0.5794            -0.5263
##   fBodyGyro-mean()-Z fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z
## 1            -0.4312           -0.6769           -0.4671           -0.5225
##   fBodyGyro-meanFreq()-X fBodyGyro-meanFreq()-Y fBodyGyro-meanFreq()-Z
## 1                -0.1298                -0.1608               -0.04515
##   fBodyAccMag-mean() fBodyAccMag-std() fBodyAccMag-meanFreq()
## 1            -0.5055           -0.6042                0.07385
##   fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std()
## 1                    -0.5382                   -0.5485
##   fBodyBodyAccJerkMag-meanFreq() fBodyBodyGyroMag-mean()
## 1                         0.1167                 -0.5473
##   fBodyBodyGyroMag-std() fBodyBodyGyroMag-meanFreq()
## 1                -0.5883                    -0.00263
##   fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
## 1                     -0.6593                    -0.6705
##   fBodyBodyGyroJerkMag-meanFreq()
## 1                         0.09479
```
The above example shows that for Subject 20 in his/her layting activity, the average value of the X dimension body acceleration signals means ```tBodyAcc-mean()-X``` is 0.2682; his/her average value of the Z dimension body gyroscope signals standard deviations ```tBodyGyro-std()-Z``` is -0.4608; his/her average values of the magnitude of 3-dimension gravity acceleration signals ```tGravityAccMag-std()``` is -0.519; etc...



~ End ~

