#Step One: Merges the training and the test sets to create one data set, the final mergedfull object realise the prototype table data frame. See the prototype table go to the README.md file
setwd("~/Getting-and-Cleaning-Data/project.solution/") #set the working director at "~/Users/user's homefolder/Getting-and-Cleaning-Data/project.solution/"
library(dplyr) #load library dplyr and it will be used to manipulate data
traindata <- read.table("./project.data/train/X_train.txt") #load data from X_train.txt
traindata <- tbl_df(traindata) #tbl objects only print a few rows and all the columns that fit on one screen
str(traindata) #checck traindata dimensions. 7352 (rows) * 561 (cols); visualise the table and get the column names from V1 to V561
testdata<- read.table("./project.data/test/X_test.txt") #load data from X_test.txt
testdata <- tbl_df(testdata); str(testdata) #check testdata dimensions. 2947 (rows) * 561(cols); The final data frame should have (7352 + 2947) rows; traindata accounting for around 70% of total data and testdata accounting for around 30% of total data
mergeddata <- tbl_df(rbind_list(traindata,testdata)); str(mergeddata) #10299 (rows) * 561 (cols), with cols name from V1 to V561

features <- read.table("./project.data/features.txt", stringsAsFactors = FALSE) #load variable names from features.txt. Second col should be character class, thus, second statement is stringsAsFactors = FALSE

colnames(mergeddata) <- features$V2; str(mergeddata) #change megeddata variable names from (V1 - V561) to tBodyAcc-mean()-X...tBodyAccJerk-energy()-Z 

trainacts <- read.table("./project.data/train/y_train.txt") #load activities data from y_train.txt
trainacts <- tbl_df(trainacts); str(trainacts) #check trainacts dimensions. 7352 (rows) * 1 (cols), col name is V1
testacts <- read.table("./project.data/test/y_test.txt") #load activities data from y_test.txt
testacts <- tbl_df(testacts); str(testacts) #check testacts dimensions. 2947 (rows) * 1 (cols), col name is V1
mergedacts <- tbl_df(rbind_list(trainacts, testacts)); str(mergedacts) #check mergedacts dimensions. 10299 (rows) * 1 (col), with col name V1
mergedacts <- select(mergedacts, activities = V1); str(mergedacts) #change variable name V1 to activities, in order to distinguish with the V1 variable of megeddata

trainsubject <- read.table("./project.data/train/subject_train.txt") #load subject data from subject_train.txt
trainsubject <- tbl_df(trainsubject); str(trainsubject) #check trainsubject dimensions. 7352 (rows) * 1 (cols, V1) 
testsubject <- read.table("./project.data/test/subject_test.txt") #load subject data from subject_test.txt
testsubject <- tbl_df(testsubject); str(testsubject) #check testsubject dimensions. 2947 (rows) * 1 (cols, V1)
mergedsubject <- tbl_df(rbind_list(trainsubject, testsubject)); str(mergedsubject) #check mergedsubject dimensions. 10299 (rows) * 1 (cols, V1)
mergedsubject <- select(mergedsubject, volunteer = V1); str(mergedsubject) #change variable name V1 to volunteer, in order to distinguish with the V1 variable of megeddata

mergedfull <- cbind(mergedsubject, mergedacts, mergeddata) #combine three data frame into one with 10299 (rows) * 563 (cols)
mergedfull <- tbl_df(mergedfull); str(mergedfull) #check mergedfull dimensions. 

#Step two: Extracts only the measurements on the mean and standard deviation for each measurement
mergedfullsubset <- select(mergedfull, volunteer, activities, contains("mean"), contains("std")); str(mergedfullsubset); #Use the select function by dplyr to choose all the variables contain mean or std. Totally 86 variables contain mean or std, which is justified by excle filter function. Meanwhile, two variables activities and volunteer should be added as well.

#Step three: Uses descriptive activity names to name the activities in the data set
act.labels <- read.table("./project.data/activity_labels.txt")
names(act.labels) <- c("activities", "activity") #Change act.labels from V1 V2 to actitivies and activity, in order to match with mergedfullsubset by activities
mergedfullsubset <- inner_join(mergedfullsubset, act.labels); str(mergedfullsubset); #Now, the data frame is 10299 (rows) * 89 (cols) with a new variable activity
mergedfullsubset <- select(mergedfullsubset, volunteer, activity, contains("mean"),contains("std")); str(mergedfullsubset) #obersvations of variable activities and variable activity are matching, then exclude variable activities, only matain variable activity, then reorder the variable the first two variables are volunter and activity

#Step four: Appropriately labels the data set with descriptive variable names
names(mergedfullsubset) <- gsub("-", " ", names(mergedfullsubset)) #remove "-"
names(mergedfullsubset) <- gsub("\\(\\)", "", names(mergedfullsubset)) #remove "()"
names(mergedfullsubset) #check the cleaned variable names
write.table(mergedfullsubset, "cleaneddata.txt") #Save the cleaned data to the cleaneddata.txt

#Step five: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

tidydata <- read.table("cleaneddata.txt") #load cleaneddata named tidydata
tidydata <- tbl_df(tidydata); str(tidydata) #transfer to tbl_df class
tidydatamean <- tidydata %>% #Using chain %>% function to sequence the operations
        group_by(volunteer, activity) %>% #first groud each activity and each volunteer. Activity and volunteer are matched. There are 30 volunteers, each volunteer have six activities, 30 * 6 = 180 rows. 88 cols
        summarise_each(funs(mean(., na.rm = TRUE)), matches("mean"),matches("std")) #use summarise_each function to calculate each variable means

tidydatamean
write.table(tidydatamean,"tidydatamean.txt") #Save and creat a second tidy data set names tidydatamean.txt
write.csv(tidydatamean, "tidydatamean.csv") #Save and creat a csv file
