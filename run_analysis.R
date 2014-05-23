library(plyr)

####### Step 1 #########
fl_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, stringsAsFactors=FALSE)
fl_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, stringsAsFactors=FALSE)
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, stringsAsFactors=FALSE)
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, stringsAsFactors=FALSE)
act_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, stringsAsFactors=FALSE)
act_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, stringsAsFactors=FALSE)
feat <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
colnames(subj_train) <- c("subject")
colnames(subj_test) <- c("subject")
colnames(act_train) <- c("activity")
colnames(act_test) <- c("activity")
fl_train <- cbind(fl_train, subj_train, act_train)
fl_test <- cbind(fl_test, subj_test, act_test)
res <- rbind(fl_train, fl_test)
#########################
######## Step 2 #########
colnames(res) <- c(feat[,2], "subject", "activity")
ind_col <- grep("(mean|std)\\(\\)", names(res))
ind_col <- c(ind_col, 562, 563)
res <- res[,ind_col]
#########################
######### Step 3 ########
res$activity <- as.character(res$activity)
# merge plutot
res$activity <- revalue(res$activity, replace=c("1"="walking", "2"="upstairs", "3"="downstairs", "4"="sitting", "5"="standing", "6"="laying"))
#########################
######### Step 4 ########
names(res) <- sub("-mean", "Mean", names(res))
names(res) <- sub("-std", "Std", names(res))
names(res) <- sub("\\(\\)", "", names(res))
names(res) <- sub("BodyBody", "Body", names(res))
names(res) <- gsub("-", "", names(res))
#########################
######### Step 5 ########
df <- data.frame(matrix(NA, nrow=180, ncol=68))
colnames(df) <- names(res)
for (i in 1:66)
{
    c <- as.vector(tapply(res[,i], list(res$subject, res$activity), mean))
    df[,i] <- c
}
df[,67] <- rep(1:30, 6)
df[,68] <- rep(c("downstairs", "laying", "sitting", "standing", "upstairs", "walking"), each=30)
write.table(df, file="tidy_data.txt", sep=" ", quote=FALSE)
#########################
