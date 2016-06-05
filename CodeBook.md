#Cleaning and Getting Data Project - Code Book

The R script run_analysis.R, reads the processed experiment data and performs the following steps to get it into the summary described in the project.
  
- Load the libraries used in the project (plyr library);
- Read in files with test and train datasets to data frames;
- Give names to the data frames based on the file features.txt;
- Join the information of subject id and activity id into the data frames test and train;
- Merge the test and train data frames into onde data frame;
- Select the columns with mean or std (standard deviation) measurements to a new data frame;
- Replace the activity id with the activity labels based on the file activity_labels.txt;
- Remove the unnecessary data from the environment;
- Fix the variable name of some columns that repeated the word Body in its name. Replace the word BodyBody with Body;
- Remove some invalid characters from the column names;
- Aggregate the data by subject and activity, calculating the mean of each variable into a new data frame.
- Include the word avg in the beginning of each variable.
- Write the summary dataset to file testTrainDataAvg.txt. 

###################

#Columns in output file.

subject - identifies the volunteer (subject) who performed the activity for each window sample in the experiment. Its range is from 1 to 30. 

activity - the description of the activity performed in the experiment: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The columns above are the variables of the experiment that represent the average for some selected variables in the project for the given subject and activity. Details of the different measurement type and how they have been measured can be found in the data zip file.

avgTBodyAccMeanX, avgTBodyAccMeanY, avgTBodyAccMeanZ, avgTBodyAccStdX, avgTBodyAccStdY, avgTBodyAccStdZ, avgTGravityAccMeanX, avgTGravityAccMeanY, avgTGravityAccMeanZ, avgTGravityAccStdX, avgTGravityAccStdY, avgTGravityAccStdZ, avgTBodyAccJerkMeanX, avgTBodyAccJerkMeanY, avgTBodyAccJerkMeanZ, avgTBodyAccJerkStdX, avgTBodyAccJerkStdY, avgTBodyAccJerkStdZ, avgTBodyGyroMeanX, avgTBodyGyroMeanY, avgTBodyGyroMeanZ, avgTBodyGyroStdX, avgTBodyGyroStdY, avgTBodyGyroStdZ, avgTBodyGyroJerkMeanX, avgTBodyGyroJerkMeanY, avgTBodyGyroJerkMeanZ, avgTBodyGyroJerkStdX, avgTBodyGyroJerkStdY, avgTBodyGyroJerkStdZ, avgTBodyAccMagMean, avgTBodyAccMagStd, avgTGravityAccMagMean, avgTGravityAccMagStd, avgTBodyAccJerkMagMean, avgTBodyAccJerkMagStd, avgTBodyGyroMagMean, avgTBodyGyroMagStd, avgTBodyGyroJerkMagMean, avgTBodyGyroJerkMagStd, avgFBodyAccMeanX, avgFBodyAccMeanY, avgFBodyAccMeanZ, avgFBodyAccStdX, avgFBodyAccStdY, avgFBodyAccStdZ, avgFBodyAccJerkMeanX, avgFBodyAccJerkMeanY, avgFBodyAccJerkMeanZ, avgFBodyAccJerkStdX, avgFBodyAccJerkStdY, avgFBodyAccJerkStdZ, avgFBodyGyroMeanX, avgFBodyGyroMeanY, avgFBodyGyroMeanZ, avgFBodyGyroStdX, avgFBodyGyroStdY, avgFBodyGyroStdZ, avgFBodyAccMagMean, avgFBodyAccMagStd, avgFBodyAccJerkMagMean, avgFBodyAccJerkMagStd, avgFBodyGyroMagMean, avgFBodyGyroMagStd, avgFBodyGyroJerkMagMean, avgFBodyGyroJerkMagStd

#Additional information
Detailed information on the experiment and the data can be found in the README.txt and features_info.txt files included in the experiment data zip file or on the dataset homepage: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
