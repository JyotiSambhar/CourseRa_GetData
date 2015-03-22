#Script reads raw data files and creates tidy data set as per Coursera getcleandata course project
library(dplyr)

#column Names
featuresdata<-read.table("features.txt",header=FALSE)

#Column names with Mean or STD
colnm<-featuresdata[c(grep("std",featuresdata$V2,ignore.case=TRUE),grep("mean",featuresdata$V2,ignore.case=TRUE)),2]

#Activity Labels
actlbl<-read.table("activity_labels.txt",header=FALSE)

#Train data
#Read Train data sets
xtraindata<-read.table("./train/X_train.txt",header=FALSE)
subjecttrain<-read.table("./train/subject_train.txt",header=FALSE)
ytraindata<-read.table("./train/y_train.txt",header=FALSE)
#Bind Train data sets into one
traindata<-cbind(subjecttrain,ytraindata,xtraindata[,colno])

#Read Test Data sets
xtestdata<-read.table("./test/X_test.txt",header=FALSE)
subjecttest<-read.table("./test/subject_test.txt",header=FALSE)
ytestdata<-read.table("./test/y_test.txt",header=FALSE)
#Bind Test data sets into one
testdata<-cbind(subjecttest,ytestdata,xtestdata[,colno])

#Merge Train and Test Data
#tempdata<-merge(traindata,testdata,all=TRUE)
Mergedata<-rbind(traindata,testdata)

#Inster column names
colnames(Mergedata)<-c("Subject","Activity",as.vector(colnm))

#Insert Activity Name
Mergedata$Activity<-as.factor(Mergedata$Activity)
levels(Mergedata$Activity)<-as.vector(actlbl[,2])

#Group Merged data by Subject and Activity
Groupdata<-group_by(Mergedata,Subject,Activity)

#Calculate Mean of grouped data
step5data<-summarise_each(Groupdata,funs = "mean")

#Write into text file
write.table(step5data,"tidydata.txt",row.name=FALSE)