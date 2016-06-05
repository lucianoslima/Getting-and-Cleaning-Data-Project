#load plyr library
library(plyr)

#reading files
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
                     
#naming colummns
colnames(x_test)<-features$V2
colnames(x_train)<-features$V2
colnames(y_test)<-"activityid"
colnames(y_train)<-"activityid"
colnames(subject_train)<-"subject"
colnames(subject_test)<-"subject"
colnames(activity_labels)<-c("activityid","activity")
                     
#inserting id to join
y_test<-mutate(y_test,id=rownames(y_test))
x_test<-mutate(x_test,id=rownames(x_test))
subject_test<-mutate(subject_test,id=rownames(subject_test))
y_train<-mutate(y_train,id=rownames(y_train))
x_train<-mutate(x_train,id=rownames(x_train))
subject_train<-mutate(subject_train,id=rownames(subject_train))

# join test data
dfTestList=list(x_test,y_test,subject_test)
dfTest<-join_all(dfTestList,"id")
                     
#join train data
dfTrainList=list(x_train,y_train,subject_train)
dfTrain<-join_all(dfTrainList,"id")
                     
#attaching rows
mergedData<-rbind(dfTest,dfTrain)

#droping col id
mergedData<-mergedData[!(names(mergedData) %in% c("id"))]

#selecting cols
newData<-mergedData[,grep("mean[()]|std[()]|activityid|subject", names(mergedData))]

#substituting activity_id to activate_labels, describing the activity
testTrainData<-merge(newData,activity_labels, by="activityid")
testTrainData<-testTrainData[!(names(testTrainData) %in% c("activityid"))]

# removing data that we don't need anymore
rm(subject_test, x_test, y_test, subject_train,x_train, y_train, dfTest, dfTestList, dfTrain, dfTrainList, activity_labels, features, mergedData, newData)

#fixing the variable name of some cols that repeated the word Body
colnames(testTrainData)<-gsub("BodyBody","Body",colnames(testTrainData))

#cleaning up colnames of testTrainData
colnames(testTrainData)<-gsub("-|_|[()]","",colnames(testTrainData))
colnames(testTrainData)<-gsub("std","Std",colnames(testTrainData))
colnames(testTrainData)<-gsub("mean","Mean",colnames(testTrainData))

#agreggating data by subject and activity
testTrainDataAvg<-aggregate(testTrainData[,1:66], testTrainData[,67:68], FUN = mean)

#including avg in the colnames variables of testTrainDataAvg
colnames(testTrainDataAvg)<-gsub("^t","avgT",colnames(testTrainDataAvg))
colnames(testTrainDataAvg)<-gsub("^f","avgF",colnames(testTrainDataAvg))

#writing file
write.table(testTrainDataAvg,file="testTrainDataAvg.txt",row.names=FALSE)



