Introduction of Getting-and-Cleaning-Data Project
========================================================================

This is an introduction of Getting-and-Cleaning-Data Projetc. This file explains how to understand the initial research purpose in order to better understand the course project. This introduction includes six sections:

1. Original data set
2. Unserstand the relationship between different data files.
3. Transform the understanding to a prototype data frame
4. Five steps to explain how the script works
5. CodeBook explanation 
6. Copyright of the work

#Original data set

*       Data for the project can be downloaded from the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*       A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Understand the relationship between different data files
In order to understand the relationship between different text files, it is important to know the purpose of the research and where the data came from. If you are interested in this research, you can read the paper [Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine](http://www.icephd.org/sites/default/files/IWAAL2012.pdf)

The initial purpose of this research is to investigate whether the build-in smartpone sensors can be utilised to identify people's activity. As we know that there are many sensors in our smartphone, such as, GPS, camera, accelerometer and gyroscope. It is very interesting to know that if these sensors can help us to monitor our daily activity and helth conditions. 

In order to find the answers, observing people's activities might be one of methodology to obtain the data. 

Thus, the research was conducted with 30 volunteers in observing and recording their activities. Six regular categorical acitvities were defined. They are:

 * WALKING
 * WALKING_UPSTARIS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING
 
In oder to tell the computer which activity it is, 561 features (variables) were used. The processing diagram is explained by the research authors. _If the pic can't be open, you can go to click the process.png in this repo to have a look._

![Alt text](https://raw.githubusercontent.com/weijia2013/Getting-and-Cleaning-Data/master/project.solution/process.png)
citation: http://www.icephd.org/sites/default/files/IWAAL2012.pdf
 
# Transform the understanding to a prototype data frame

Based on the last section, we just have a imagine the data frame table would be look like the following table

|volunteer     |activities     |feature 1          |feature i    |feature 561          |
|------------- |:-------------:|:-----------------:|:-----------:| -------------------:|
|1             |WALKING        |tBodyAcc-mean()-X  |.........    |angle(Z, gravityMean)|
|1             |WALKING        |tBodyAcc-mean()-X  |.........    |angle(Z, gravityMean)|
|.             | .             | .                 |      .      |         .           |
|.             | .             | .                 |      .      |         .           |

As we know that all these observations and variables are stored in different locations, train and test. Thus we need to combine them together and match the file names.


|volunteer         |activities (Index by activity_labels.txt)|feature 1 to 561  (feature.txt) |
|----------------- |:---------------------------------------:| ------------------------------:|
|subject_train.txt |             y_train.txt                 |          X_train.txt           |
|.                 |                    .                    |                .               |
|.                 |                    .                    |                .               |                       
|subject_test.txt  |             y_test.txt                  |          X_test.txt            |
|.                 |                    .                    |                                |

From the table, it can be clearly seen that **_eight_** txt files will be needed to generate a raw data frame. 

#Five step to explain how the script works


This section explains how to transfer and realise the prototype table data frame based on last section. The whole script can be accessed at `run_analysis.R` file

###1. Step one

Step One: Merges the training and the test sets to create one data set, the final mergedfull object realise the prototype table data frame. 

#### Prototype col 3
- Data need to be downloaded and the folder need to be renamed to project.data first.
- Save the folder project.data to the parent folder project.solution.
- The project.solution folder will be set as working directory for this project.
- Set the working director at "~/Users/your homefolder/Getting-and-Cleaning-Data/project.solution/"
- Load library **_dplyr_** and it will be used to manipulate data. If you do not install the package, you would be install the package first. If you want to have a look have dplyr work, you should do the **_swirl Programming Assignment_**. The package 'dplyr' [pdf](http://cran.r-project.org/web/packages/dplyr/dplyr.pdf) document can be accessed and the script will use some of the functions in different steps.
- Load data by `read.table` function from both `X_train.txt` (dimensions: 7352 * 561) and `X_test.txt` (dimensions: 2947 * 561).
- Transfer data frame to `tbl_df class` by `tbl_df()` function.
- Merge two data object to one named `mergeddata` by `rbind_list()` function.
- Load 561 variable names from features.txt. Second col should be character class, thus, second statement is stringsAsFactors = FALSE.
- Change megeddata object names from (V1 - V561) to tBodyAcc-mean()-X...tBodyAccJerk-energy()-Z.
- Prototype col 3 finished.

#### Prototype col 2
- Load data by `read.table()` function from both `y_train.txt` (dimensions: 7352 * 561) and `y_test.txt` (dimensions: 2947 * 561).
- Transfer data frame to `tbl_df class` by `tbl_df()` function.
- Merge two data object to one named `mergedacts` by `rbind_list()` function.
- Prototype col 2 finished.

#### Prototype col 1
- Load data by `read.table()` function from both `subject_train.txt` (dimensions: 7352 * 561) and `subject_test.txt` (dimensions: 2947 * 561).
- Transfer data frame to `tbl_df class` by `tbl_df()` function.
- Merge two data object to one named `mergedsubject` by `rbind_list()` function.
- Prototype col 2 finished.

#### Realise the Prototype table data frame
- Merge three data object `mergeddata`,`mergedacts`,`mergedsubject` to one named `mergedfull` by `rbind_list()` function.
- Step one finished.

###2. Step two

Step two explains: Extracts only the measurements on the mean and standard deviation for each measurement.

- Use the `select()` function by dplyr to choose all the variables contain mean or std. Totally 86 variables contain mean or std, which is justified manually by excle filter function. Meanwhile, two variables activities and volunteer should be added as well. 
- How to use the `select()` funciton you can find from the [pdf document](http://cran.r-project.org/web/packages/dplyr/dplyr.pdf).
- Extracted object named mergedfullsubset.
- Step two finished

###3. Step three

Step three explains: Uses descriptive activity names to name the activities in the data set.

- Load data by `read.table()` function from both `activity_labels.txt` (dimensions: 6 * 2), name the object as `act.labels`.
- Change the object names V1 to activities, and V2 to activity, do not worry two similar variable names, later we will use one only
- Use `inner_join()` function to match object `mergedfull` and `act.labels` by their both variable "activities". `mergedfull` dimensions: 10299 * 89
- Exclude variable "activities", reorder rest variables let "volunteer" is col 1, "activity" is col 2, and remain the rest by `select()` function.
- Steep three finished

###4. Step four

Step four explains: Appropriately labels the data set with descriptive variable names.
- Remove "-".
- Remove "()".
- Save the cleaned data to the cleaneddata.txt.
- Step four finished.

###5. Step five

Step five explains: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- Load cleaneddata to a object named tidydata.
- Transfer data frame to `tbl_df class` by `tbl_df()` function.
- Using `chain %>%` function to sequence the operations.
- First groud each activity and each volunteer. Activity and volunteer are matched. There are 30 volunteers, each volunteer have six activities, 30 * 6 = 180 rows. 88 cols
- Use `summarise_each` function to calculate each variable means.
- Save and creat a second tidy data set names tidydatamean.txt
- Write.csv(tidydatamean, "tidydatamean.csv") #Save and creat a csv file.
- Step five finished.

# CodeBooke explanation


Details of all the variables and names' of each object can be found at CodeBooke.md file.


# Copyright of the work
# © Weijia Chen Reserves All Rights, 2014.

This repository's contents are all my own work. It provides my personal solustions for the Coursera course named: Getting-and-Cleaning-Data.

Thanks in advance to those who will assign my work. I hope this README.md file can help you understand my work. If anything you don't understand, you can discuss with me. :-)

I'm a R begineer. For those like me, learning curve is very steep for R beginners in taking this course. Quizzes are fairly challenging. However, I still strongly recommend you do the quiz and project by yourself. If you've spent more than a few hours on the quizzes, I suggest you can have a break and clear your head. If you still can't figure them out, code in this rerepository might be help you in somewhat.