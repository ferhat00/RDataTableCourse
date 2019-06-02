library(data.table)

path = "C:/Users/Ferhat/Documents/GitHub/RDataTableCourse/keystone/UCIHARDataset/"

# Data input

# Training
subject_train <- read.table(paste0(path,"train/subject_train.txt"))
X_train <- read.table(paste0(path, "train/X_train.txt"))
y_train <- read.table(paste0(path, "train/y_train.txt"))

# Test data
subject_test <- read.table(paste0(path, "test/subject_test.txt"))
X_test <- read.table(paste0(path, "test/X_test.txt"))
y_test <- read.table(paste0(path, "test/y_test.txt"))

# Features
features <- read.table(paste0(path, "features.txt"), as.is = TRUE)

# Activity
activities <- read.table(paste0(path, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

# Convert to Data Tables
subject_train = as.data.table(subject_train)
subject_test = as.data.table(subject_test)
X_train = as.data.table(X_train)
y_train = as.data.table(y_train)
X_test = as.data.table(X_test)
y_test = as.data.table(y_test)

setnames(activities, old = c("V1", "V2"), new =  c("activityId", "activityLabel"))

# Merge


# concatenate individual data tables to make single data table
humanActivity = rbind(cbind(subject_train, X_train, y_train),
                       cbind(subject_test, X_test, y_test))


# assign column names
colnames(humanActivity) = c("subject", features[, 2], "activity")
keep_cols = columnsToKeep = grepl("subject|activity|mean|std", colnames(humanActivity))

humanActivity = humanActivity[, ..keep_cols]
