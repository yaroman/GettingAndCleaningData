#----Check if directory exists---Create if not---
if(!file.exists("./data")) { dir.create(./data) }

#------------Load and renames activities labels
activity_labels <-read.table("data/UCI_HAR_Dataset/activity_labels.txt", stringsAsFactors=FALSE)
names(activity_labels) = c("activityNo","activity")

#--------------Test Set Loading. Merging data, subjects, and activities--------------
testX <-read.table("data/UCI_HAR_Dataset/test/X_test.txt")
testY <-read.table("data/UCI_HAR_Dataset/test/y_test.txt")
names(testY) = "activityNo"
testS <-read.table("data/UCI_HAR_Dataset/test/subject_test.txt")
names(testS) = "subject"
test <-cbind(cbind(testS,testY),testX)
test <- merge(activity_labels, test, by="activityNo", all=TRUE, sort=FALSE)
test <- test[,c(-1)]



#-------------Train Set. Merging data, subjects, and activities-----------
trainX <-read.table("data/UCI_HAR_Dataset/train/X_train.txt")
trainY <-read.table("data/UCI_HAR_Dataset/train/y_train.txt")
names(trainY) = "activityNo"
trainS <-read.table("data/UCI_HAR_Dataset/train/subject_train.txt")
names(trainS) = "subject"
train <-cbind(cbind(trainS,trainY),trainX)
train <- merge(activity_labels, train, by="activityNo", all=TRUE, sort=FALSE)
train <- train[,c(-1)]



#------------------Combine two sets in one-------------
all <-rbind(test,train, row.names=NULL)

#------------------Rename columns in "all" set from 2 to the last from the features file
# 	        Changing names starting from 3rd because we added the first two columns: subjectNo and activity

features<-read.table("data/UCI_HAR_Dataset/features.txt", stringsAsFactors = FALSE)[,2]

names(all)[3:length(names(all))] = features

#------------------Select only column names matching "-mean()" or "-std()" pattern-------------------
means_sds <- suppressWarnings(unique(sort(rbind(grep("-mean\\(\\)", names(all), ignore.case=TRUE),grep("-std\\(\\)", names(all), ignore.case=TRUE)))))
all.selected <- cbind(all[,c(2,1)], all[means_sds])

# ----------------Aggregating data using "mean" ---------------------
attach(all.selected)
all.selected.aggregated <-suppressWarnings(aggregate(all.selected, by=list(subject,activity), FUN=mean, na.rm=TRUE)[,c(-3,-4)])
names(all.selected.aggregated)[c(1,2)] = c("subject","activity")
detach(all.selected)

#------Changing column names-------------
library(plyr)
col_names <- names(all.selected.aggregated)

col_names = gsub("-mean\\(\\)","Mean",col_names) 
col_names = gsub("-std\\(\\)","StandardDeviation",col_names)
col_names = gsub("-","",col_names)
col_names = gsub("Acc","Acceleration",col_names)
col_names = gsub("Body","",col_names)
col_names = gsub("^[t]","time",col_names)
col_names = gsub("^[f]","frequency",col_names)

names(all.selected.aggregated) = col_names

#-----Tidying----Melting---------Switching from wide to long format-------Re-Arranging---------
library(reshape2)
all.selected.aggregated.melted <- melt(all.selected.aggregated, id.vars=c("subject","activity"),value.name = "value")
all.selected.aggregated.melted <- arrange(all.selected.aggregated.melted, subject, activity, variable)


#----Writing final data to CSV

if(!file.exists("./data")) { dir.create(./data) }
write.csv(all.selected.aggregated.melted, "data/cleanData.csv",row.names=FALSE)

