CodeBook of Getting-and-Cleaning-Data Project
========================================================================

This is the CodeBook of Getting-and-Cleaning-Data Projetc. This file explains the work that I have done in cleaning up the data.

*       Data for the project can be downloaded from the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*       A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Understand the relationship between different data files
In order to understand the relationship between different text files, it is important to know the purpose of the research and where the data came from. If you are interested in this research, you can read the paper [Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine](http://www.icephd.org/sites/default/files/IWAAL2012.pdf)

> The initial purpose of this research is to investigate whether the build-in smartpone sensors can be utilised to identify people's activity. As we know that there are many sensors in our smartphone, such as, GPS, camera, accelerometer and gyroscope. It is very interesting to know that if these sensors can help us to monitor our daily activity and helth conditions. 

In order to find the answers, observing people's activities might be one of methodology to obtain the data. 

> Thus, the research was conducted with 30 volunteers in observing and recording their activities. Six regular categorical acitvities were defined. They are:

 * WALKING
 * WALKING_UPSTARIS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING
 
> In oder to tell the computer which activity it is, 561 features (variables) were used. The processing diagram is explained by the research authors.

![Alt text](/Users/Mavis/Getting-and-Cleaning-Data/project.solution/process.png)
citation: http://www.icephd.org/sites/default/files/IWAAL2012.pdf
 
## Transform the understanding to a prototype data frame

> Based on the last section, we just have a imagine the data frame table would be look like the following table

|volunteer     |activities     |feature 1          |feature i    |feature 561          |
|------------- |:-------------:|:-----------------:|:-----------:| -------------------:|
|1             |WALKING        |tBodyAcc-mean()-X  |.........    |angle(Z, gravityMean)|
|1             |WALKING        |tBodyAcc-mean()-X  |.........    |angle(Z, gravityMean)|
|.             | .             | .                 |      .      |         .           |
|.             | .             | .                 |      .      |         .           |

> As we know that all these observations and variables are stored in different locations, train and test. Thus we need to combine them together and match the file names.


|volunteer         |activities (Index by activity_labels.txt)|feature 1 to 561  (feature.txt) |
|----------------- |:---------------------------------------:| ------------------------------:|
|subject_train.txt |             y_train.txt                 |          X_train.txt           |
|.                 |                    .                    |                .               |
|.                 |                    .                    |                .               |                       
|subject_test.txt  |             y_test.txt                  |          X_test.txt            |
|.                 |                    .                    |                                |

> From the table, it can be clearly seen that **_eight_** txt files will be needed to generate a raw data frame. 


## © Weijia Chen Reserves All Rights, 2014.