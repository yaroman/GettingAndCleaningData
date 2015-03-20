## Code Book

Initial data is represented by "test" and "train" data sets sitting in "X_test.txt", "Y_test.txt", "subject_test.txt", "X_train.txt", "Y_Train.txt", "subject_train.txt respectively.  Shared data sits in "activity_labels.txt" and "features.txt" files. 

-----------------------------------------------------------------------

Steps performed by the "run_analysis.R":

1. Check if "data" directory exists. Creates it if not. 

2. Load in activities labels
  This is a compete list of activities
  1 WALKING
  2 WALKING_UPSTAIRS
  3 WALKING_DOWNSTAIRS
  4 SITTING
  5 STANDING
  6 LAYING

3. "Test" set data processing step: loads "x", "y", and "subject" data files. Merges data, subjects, and activities

4. "Train" set data processing step: loads "x", "y", and "subject" data files. Merges data, subjects, and activities

5. Merge two sets together into the "all" data set. Result: 'data.frame':   10299 obs. of  563 variables:

6. Identify only the columns that have "-mean()" and "-std()" as a part of their names. Create a new data set "all.selected" based on this selection.

7. Aggregate the data set from the step 6 into a new data set "all.selected.aggregated" using the "mean" function.

8. Changing column names in  order to provide descriptive variable names.
   
   Changes:
   a. "-mean()" replaced with "Mean" 
   b. "-std()" replaced with "StandardDeviation"
   c. Removed "-"
   d. "Acc" replaced with "Acceleration"
   e. Removed "Body"
   g. Find all variables starting with "t" and replace "t" with "time"
   h. Find all variables starting with "f" and replace "t" with "frequency""

9. Switching from a "wide" to a "long" output format

10.Re-ordering the output data set by "subject" and "activity"

11. Export the tidy data set into the csv file. 

-----------------------------------------------------------------------
 Output data set review
 'data.frame':   11880 obs. of  4 variables:
 $ subject : int  1 1 1 1 1 1 1 1 1 1 ...
 $ activity: chr  "LAYING" "LAYING" "LAYING" "LAYING" ...
 $ variable: Factor w/ 66 levels "timeAccelerationMeanX",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ value   : num  0.2216 -0.0405 -0.1132 -0.9281 -0.8368 ...

Variable column values (all numeric) which represent all selected measurement types generated in the step 8:

timeAccelerationMeanX
timeAccelerationMeanY
timeAccelerationMeanZ
timeAccelerationStandardDeviationX
timeAccelerationStandardDeviationY
timeAccelerationStandardDeviationZ
timeGravityAccelerationMeanX
timeGravityAccelerationMeanY
timeGravityAccelerationMeanZ
timeGravityAccelerationStandardDeviationX
timeGravityAccelerationStandardDeviationY
timeGravityAccelerationStandardDeviationZ
timeAccelerationJerkMeanX
timeAccelerationJerkMeanY
timeAccelerationJerkMeanZ
timeAccelerationJerkStandardDeviationX
timeAccelerationJerkStandardDeviationY
timeAccelerationJerkStandardDeviationZ
timeGyroMeanX
timeGyroMeanY
timeGyroMeanZ
timeGyroStandardDeviationX
timeGyroStandardDeviationY
timeGyroStandardDeviationZ
timeGyroJerkMeanX
timeGyroJerkMeanY
timeGyroJerkMeanZ
timeGyroJerkStandardDeviationX
timeGyroJerkStandardDeviationY
timeGyroJerkStandardDeviationZ
timeAccelerationMagMean
timeAccelerationMagStandardDeviation
timeGravityAccelerationMagMean
timeGravityAccelerationMagStandardDeviation
timeAccelerationJerkMagMean
timeAccelerationJerkMagStandardDeviation
timeGyroMagMean
timeGyroMagStandardDeviation
timeGyroJerkMagMean
timeGyroJerkMagStandardDeviation
frequencyAccelerationMeanX
frequencyAccelerationMeanY
frequencyAccelerationMeanZ
frequencyAccelerationStandardDeviationX
frequencyAccelerationStandardDeviationY
frequencyAccelerationStandardDeviationZ
frequencyAccelerationJerkMeanX
frequencyAccelerationJerkMeanY
frequencyAccelerationJerkMeanZ
frequencyAccelerationJerkStandardDeviationX
frequencyAccelerationJerkStandardDeviationY
frequencyAccelerationJerkStandardDeviationZ
frequencyGyroMeanX
frequencyGyroMeanY
frequencyGyroMeanZ
frequencyGyroStandardDeviationX
frequencyGyroStandardDeviationY
frequencyGyroStandardDeviationZ
frequencyAccelerationMagMean
frequencyAccelerationMagStandardDeviation
frequencyAccelerationJerkMagMean
frequencyAccelerationJerkMagStandardDeviation
frequencyGyroMagMean
frequencyGyroMagStandardDeviation
frequencyGyroJerkMagMean
frequencyGyroJerkMagStandardDeviation
