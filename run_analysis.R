#open  text files and check the files' structure
X_test <- read.table('./test/X_test.txt')
str(X_test)
y_test <- read.table('./test/y_test.txt')
str(y_test)
subject_test <- read.table('./test/subject_test.txt')
str(subject_test)
# all of the files read into R -named 'subject_test', 'y_test' and 'X_test', which 
#    demonstrate subjects' identifiers, activity types and observations respectively-
#   contain the same number of observations. Just to merge them directly to form one data set.
test <- cbind.data.frame(subject_test, y_test, X_test)

#open the train files and check the files' structure
X_train <- read.table('./train/X_train.txt')
str(X_train)
y_train <- read.table('./train/y_train.txt')
str(y_train)
subject_train <- read.table('./train/subject_train.txt')
str(subject_train)
# all of the files read into R -named 'subject_train', 'y_train' and 'X_train', which 
#    demonstrate subjects' identifiers, activity types and observations respectively-
#   contain the same number of observations. Just 
train <- cbind.data.frame(subject_train, y_train, X_train)


# to merge test and train files directly to form one data set.
data1 <-  rbind.data.frame(test, train)

# to extract variables  with mean() or std() only based on the features.text file 
data2 <- data1[ , c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 
                    229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 
                    531:532, 544:545)]

# to change activity IDs with activity names by using activity_labels.txt file.
ac_lables <- read.table('activity_labels.txt')

for (i in 1:10299)
  
  {data2[i, 2] <- ac_lables[which(data2[i,2] == ac_lables$V1), 2]
  
   i <- i+1
   }
  
# to label the data set with descriptive variable names.
features <- read.table('features.txt')
sub_f <- features$V2[c(1:6, 41:46,81:86, 121:126, 161:166, 201:202, 214:215, 
                     227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 
                     503:504, 516:517, 529:530, 542:543)]
colnames(data2) <- c('ID', 'activity', sub_f)

#to produce an independent 'tidy-data' set with average of variables for each subject and each 
# activities, as is required by the assignment.


data3 <- data2[ order(data2$ID, data2$activity), ]
rownames(data3) <- 1:nrow(data3)

tidy_data <- data3 %>% group_by(ID, activity) %>% summarise_each(funs(mean), names(data3[ , -(1:2)]))
  
