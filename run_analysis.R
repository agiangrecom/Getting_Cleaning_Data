
# Setup Libraries
library(dplyr)
library(tidyr)


# Download file
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','data.zip')

# Unzip file
unzip('data.zip', exdir = '.')

# Read train datasets
x_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('./UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')

# combine train datasets
train <- cbind(x_train, y_train, subject_train)

# Read test datasets
x_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('./UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# combine test datasets
test <- cbind(x_test, y_test,subject_test)

#combine train and test
total <- rbind(train, test)

# cleanup workspace
rm(x_train, x_test, y_train, y_test, train, test, subject_train, subject_test)

# Feature names
features <- read.table('./UCI HAR Dataset/features.txt', stringsAsFactors = FALSE)

# Rename columns based on features table
colnames(total) <- c(features[,2],"Activity","Subject")

# Subset down to columns with "mean()" and "std()" as well as the activity and subject
df <- total[,
            grepl('mean\\(\\)',colnames(total)) | grepl('std\\(\\)',colnames(total)) | grepl('Activity',colnames(total)) | grepl('Subject',colnames(total))]

#Read in activity code decode and join
activity <- read.table('./UCI HAR Dataset/activity_labels.txt', col.names = c('Activity','Activity_Desc'))
df <- inner_join(df, activity, by = c('Activity' = 'Activity')) %>% select(-Activity)

#Rename based on Time and FFT first (t - Time, f - Freq)
colnames(df) <- gsub('^t','Time_',colnames(df))
colnames(df) <- gsub('^f','Freq_',colnames(df))

#Rename Body vs Gravity
colnames(df) <- gsub('Body','Body_',colnames(df))
colnames(df) <- gsub('Gravity','Gravity_',colnames(df))

# Accel vs Gyro
colnames(df) <- gsub('Acc','Accel_',colnames(df))
colnames(df) <- gsub('Gyro','Gyro_',colnames(df))

#Jerk and Magnitude
colnames(df) <- gsub('Jerk','Jerk_',colnames(df))
colnames(df) <- gsub('Mag','Magnitude_',colnames(df))

#Drop '-' and '()'
colnames(df) <- gsub('-','',colnames(df))

#Mean and Std
colnames(df) <- gsub('mean\\(\\)','Mean_',colnames(df))
colnames(df) <- gsub('std\\(\\)','Std_',colnames(df))

#Remove '_' if last character
colnames(df) <- sub('_$','',colnames(df))

#Calculate the average of each variable for each activity and each subject
df_by_Subject_Activity <- df %>% group_by(Activity_Desc, Subject) %>% summarise_all(mean)

write.table(df_by_Subject_Activity,'Final_Dataset.txt',row.name = FALSE)
