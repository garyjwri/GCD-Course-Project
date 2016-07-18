# Read in all the files
# Assumes working directory is UCI HAR Dataset

stest<-read.table("test/subject_test.txt")
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/y_test.txt")
strain<-read.table("train/subject_train.txt")
xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/y_train.txt")
features<-read.table("features.txt")
ac_labels<-read.table("activity_labels.txt")

# Join the test and train datasets

s<-rbind(stest,strain)
x<-rbind(xtest,xtrain)
y<-rbind(ytest,ytrain)

# First pick out the columns that are needed
# Notice fixed=TRUE which prevents it from selecting meanFreq()!

col<-grepl("mean()",as.character(features[,2]),fixed=T)|
    grepl("std()",as.character(features[,2]),fixed=T)
xsmall<-x[,col]

# Now join the columns to make one dataset
data<-cbind(s,y,xsmall)

# Set the column names
colnames(data)<-c("Subject","Activity",
                  as.character(features[col,2]))

# Give descriptive activity names
data$Activity<-as.factor(data$Activity)
levels(data$Activity)<-ac_labels[,2]

# Split the data frame by subject and activity
data$Subject<-as.factor(data$Subject)
subac<-interaction(data$Subject,data$Activity,lex.order=T)
split<-split(data[,3:length(data)],subac)

# Take the means
means<-sapply(split,FUN=function(x)sapply(x,mean))
means<-t(means)

# Minor adjustments
tidy_data<-as.data.frame(means)
colnames(tidy_data)<-paste("Mean of",colnames(tidy_data))
Subject<-rep(1:30,each=6)
Activity<-rep(c("Walking","Walking upstairs","Walking downstairs",
                "Sitting","Standing","Laying"),30)
tidy_data<-cbind(Subject,Activity,tidy_data)
rownames(tidy_data)<-NULL
write.table(tidy_data,"tidy.txt",row.names=FALSE)