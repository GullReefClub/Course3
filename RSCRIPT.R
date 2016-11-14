
# Important: YOur working directory should be equivelant the the UCI HAR Dataset folder extracted fr
# from getdata%2Fprojectfiles%2FUCI HAR Dataset 

# Please see README.md in git hub repository for important assumptions
# -\Clean the environment of all existing objects
rm(list = ls())

#set the working directory
setwd("test")

# Read the test data into memory. This may take some time.
foo <- read.table("X_test.txt")

# Read the data for the test activities into memory
testactive <- read.table("y_test.txt")

# Read the data for the test subjects into memory
testsubjects <- read.table("subject_test.txt")

# Go to train directory
setwd("..")
setwd("train")

# Read the train data into memory. This may take some time.
bar <- read.table("X_train.txt")

# Read the data for the train activities into memory. 
trainactive <- read.table("y_train.txt")

# Read the data for the train subjects into memory
trainsubject  <- read.table("subject_train.txt")
\
# combine the data frames for the normalized test and train data
combodata <- rbind(foo,bar)
activities <- rbind(testactive,trainactive)
subjects <- rbind(testsubjects,trainsubject)


# navigate up to where the files with the text labels are stored
setwd("..")

# Read the features (activities) into memory. 
features <- read.table("features.txt", header = FALSE)

# Rename the combodata data frame.
names(combodata) <- features[,2]

# Subset our data frame to have on standard devition and mean columns
# We are assuming that these are identifiable by containing "std" or "mean" or "Mean"
# First set a test string to find the means and standard deviations
pattern <- "std|mean|Mean"

#extract the columns from combo data based on the pattern
subdata <- combodata[,grep(pattern, colnames(combodata))]

# Create a table of activity names
labels <- read.table("activity_labels.txt",col.names = c("id","activity"))

#Merge activities and labels

lookedup <- merge(x = activities,y = labels,by.x = "V1", by.y = "id",all.x = TRUE)

# combine the labels and  subject identifiers with the data
labdata <- cbind(subjects,lookedup[,2],subdata)

# Give meaningful names to the new columns
colnames(labdata)[1:2] <- c("SubjectID","Activity")

# Find the means
labmeans <-aggregate(labdata[, 3:88], by=list(labdata$Activity, labdata$SubjectID), FUN=mean, na.rm=TRUE)

# Give meaningful names to the new columns
colnames(labdata)[1:2] <- c("SubjectID","Activity")


#Output
write.csv(labmeans, file = "labmeans.csv")


