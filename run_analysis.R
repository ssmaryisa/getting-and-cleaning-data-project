#get data
if(!file.exists("./data")){dir.create("./data")}
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "data/dataset.zip")

unzip("dataset.zip", exdir = "data")

#reading and merge test and train data
xtest = read.table("data/UCI HAR Dataset/test/X_test.txt")
xtrain = read.table("data/UCI HAR Dataset/train/X_train.txt")
x = rbind(xtest, xtrain)

ytest = read.table('data/UCI HAR Dataset/test/y_test.txt')
ytrain = read.table('data/UCI HAR Dataset/train/y_train.txt')
y = rbind(ytest, ytrain)

stest = read.table('data/UCI HAR Dataset/test/subject_test.txt')
strain = read.table('data/UCI HAR Dataset/train/subject_train.txt')
s = rbind(stest, strain)

#set names to variables
names(s) = c("subject")
names(y) = c("activity")
dataFeaturesNames = read.table("data/UCI HAR Dataset/features.txt",head=FALSE)
names(x) = dataFeaturesNames$V2

#merge the collumns
datac = cbind(s,y)
data = cbind(x, datac)
      
# extracts only the measurements on the mean and standard deviation for each measurement. 
features = dataFeaturesNames$V2[grep("-mean\\(\\)|-std\\(\\)", dataFeaturesNames[, 2])]
selectedNames=c(as.character(features), "subject", "activity" )
data = subset(data,select=selectedNames)

# Uses descriptive activity names to name the activities in the data set
activities  = read.table("data/UCI HAR Dataset/activity_labels.txt")
data$activity = activities[data$activity,2]
data$activity = tolower(data$activity)
data$activity = data$activity =  gsub("_", "", data$activity)

# Appropriately labels the data set with descriptive variables names.
names(data)=gsub("^t", "time", names(data))
names(data)=gsub("^f", "frequency", names(data))
names(data)=gsub("Acc", "Accelerometer", names(data))
names(data)=gsub("Gyro", "Gyroscope", names(data))
names(data)=gsub("Mag", "Magnitude", names(data))
names(data)=gsub("BodyBody", "Body", names(data))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
data2 = aggregate(.~subject + activity, data, mean)
data2 = data2[order(data2$subject,data2$activity),]
write.table(data2, file = "data/tidydata.txt",row.name=FALSE)
