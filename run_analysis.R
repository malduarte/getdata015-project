
# Load reshape2 library, installing it if necessary
if(!require(reshape2)){
  install.packages("reshape2")
  library(reshape2)
}

# Original dataset location
data_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# file name where to save the downloaded data set
data_file <- "getdata-projectfiles-UCI HAR Dataset.zip"

# download the file if it does not exist
if(!file.exists(data_file)) {
  print(paste("Downloading", data_url))
  download.file(url = data_url, destfile = data_file)
} else {
  print(paste(data_file, "exists, skipping download"))
}

# function to extract a file from the dataset
# Without forcing the user to unzip the file
getZip <- function(file, classes = NA) {
  zipPath <- file.path("UCI HAR Dataset", file)
  print(paste("File", data_file, ": Parsing data from ", zipPath))
  read.table(unz(data_file, zipPath), header = F, stringsAsFactors = F, colClasses=classes)
}
# Read features
allfeatures <- getZip("features.txt")

# select all features related to average or standard deviation
features <- subset(allfeatures, grepl("mean|std", allfeatures$V2))[,2]
features <- gsub("-mean\\(\\)-", features, replacement = "Mean")
features <- gsub("-std\\(\\)-", features, replacement = "StandardDeviaton")

# create a column class vector. NULL indicates that a column is not to be read
# this way we can save memory and improving loading speed
classes <- allfeatures
classes[,1][!grepl("mean|std",classes[,2])] = 'NULL'  
classes[,1][grepl("mean|std",classes[,2])] = 'numeric'
classes <- classes[,1]


# Activity labels
activity_labels <- getZip("activity_labels.txt")[,2]

# Read test data sets
x_test <- getZip("test/X_test.txt", classes)
y_test <- getZip("test/y_test.txt")
subject_test <- getZip("test/subject_test.txt")

# Read train data sets
x_train <- getZip("train/X_train.txt", classes)
y_train <- getZip("train/y_train.txt")
subject_train <- getZip("train/subject_train.txt")
 

# Set test data labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("ActivityID", "ActivityLabel")
names(x_test) <- features
names(subject_test) <- "SubjectID"

# Set train data labels
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("ActivityID", "ActivityLabel")
names(x_train) <- features
names(subject_train) <- "SubjectID"


# Bind data
test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)
data <- rbind(test_data, train_data)

# Meld the data
id_col <- c("ActivityID", "ActivityLabel", "SubjectID")
meltdata <- melt(data, id=id_col, measure.vars=features)

# recast the data
castdata <- dcast(meltdata, ActivityLabel + SubjectID ~ variable, mean)

# Write the tidy file
file <- "tidy.txt"
write.table(castdata, file = file, row.names = FALSE)
print(paste("Tidy data available at", normalizePath(file)))