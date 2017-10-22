##Project1 Data Cleaning by Rapheephan L.

##Read Activity Table
Act_table<-read.table("activity_labels.txt")
Act_table[,2]<-as.character(Act_table[,2])

##Read Feature Table
Feature_table<-read.table("Features.txt")
Feature_table[,2]<-as.character(Feature_table[,2])

##Select only Features of Mean and STD
Feature_select<-grep("mean|std",Feature_table[,2])
Feature_select_table<-Feature_table[Feature_select,]

##Read test data
Test_subject_table<-read.table("./test/subject_test.txt")
Test_y_table<-read.table("./test/y_test.txt")
Test_x_table<-read.table("./test/X_test.txt")
#Select only Mean and STD column from Test_x_table
Test_x_table_select<-Test_x_table[,Feature_select]
#Merge test table
Test_table<-cbind(Test_subject_table,Test_y_table,Test_x_table_select)

##Read train data
Train_subject_table<-read.table("./train/subject_train.txt")
Train_y_table<-read.table("./train/y_train.txt")
Train_x_table<-read.table("./train/X_train.txt")
#Select only Mean and STD column from Train_x_table
Train_x_table_select<-Train_x_table[,Feature_select]
#Merge test table
Train_table<-cbind(Train_subject_table,Train_y_table,Train_x_table_select)

##Appropriately labels the data set with descriptive variable names
Feature_select_table[,2]<-gsub("-mean","Mean",Feature_select_table[,2])
Feature_select_table[,2]<-gsub("-std","STD",Feature_select_table[,2])
Feature_select_table[,2]<-gsub("[()-]","",Feature_select_table[,2])

##Merge Table Test and Train
Merge_table<-rbind(Train_table,Test_table)
colnames(Merge_table)<-c("Subject","Activity",Feature_select_table[,2])
          
##Uses descriptive activity names to name the activities in the data set
Merge_table[,2]<-factor(Merge_table[,2],levels=Act_table[,1],labels=Act_table[,2])

##Average of each variable for each activity and each subject
library(reshape2)
Merge_table_melt<-melt(Merge_table,c("Subject","Activity"))
Merge_avg_table<-dcast(Merge_table_melt,Subject+Activity ~ variable,fun=mean)

##Write table
write.table(Merge_avg_table,file="tidy_data.txt",row.names=FALSE)
