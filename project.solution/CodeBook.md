CodeBook of Getting-and-Cleaning-Data Project
=====================================================================================================
        
This is the CodeBook of Getting-and-Cleaning-Data Projetc. This file explains the meanings of each object and variables. How the scripts work can be found at README.md file.
This file infludes two sections:

1. Object names and meanings
2. Variable names and meanings

# Object names and meanings

The following table explains all the objects and the reasons to name them.

| Object name           |          Meanings                                                          |
| --------------------- |:--------------------------------------------------------------------------:|
| **_Step one_**        |              **_Explaination_**                                            |
| 1. `traindata`        | The loaded trained features numeric data from X_train.txt is stored to it  |
| 2. `testdata`         | The loaded test features numeric data from X_test.txt is stored to it      |
| 3. `mergeddata`       | traindata and testdata are combined by row and stored to it                |
| 4. `features`         | The loaded features 561 variables from features.txt is stored to it        |
| 5. `trainacts`        | The loaded trained activity numeric data from y_train.txt is stored to it  |
| 6. `testacts`         | The loaded test activity numeric data from y_test.txt is stored to it      |
| 7. `mergedacts`       | trainacts and testacts are combined by row and stored to it                |
| 8. `trainsubject`     | The loaded trained volunteer categorical data from subject_train.txt is stored to it            |
| 9. `testsubject`      | The loaded test volunteer categorical data from test_train.txt is stored to it                      |
| 10. `mergedsubject`   | trainsubject and testsubject are combined by row and stored to it          |
| 11. `mergedfull`      | `mergeddata`,`mergedsubject`,`mergedfull` are combined by col and stored to it                      |
| **_Step two_**        |              **_Explaination_**                                            |
| 1. `mergedfullsubset` | Variable `volunteer`, `activities` and variables that contains "mean" or "std" are subseted and storted to it                                                                 |
| **_Step three_**      |              **_Explaination_**                                            |
| 1. `act.labels`       | The loaded 6 categorical activity data from activity_labels.txt is stored to it                      |
| **_Step four_**       |              **_Explaination_**                                            |
| *NA*                  | No new object is introduced                                                |
| **_Step five_**       |              **_Explaination_**                                            |
| 1. `tidydata`         | The loaded cleaned data from cleaneddata is stored to it                   |
| 2. `tidydatamean`     | The result of grouped data frame by volunteer and activity and rest variables' mean are stored to it |


# Variables names and meanings

The following table explains all the objects and the reasons to name them.

| Object name           |          Meanings                                                          |
| --------------------- |:--------------------------------------------------------------------------:|
| 1. `volunteer`        | In the research, subject means volunteer                                   |
| 2. `activity`         | In the research, the purpose is to identify volunteers' activities         |
| 3. `tBodyAcc mean X`  | The explaination can be found by features_info.txt                         |
| .....i......          | ......                                                                     |
| .....i.......         | ......                                                                     |
| 88. `fBodyBodyGyroJerkMag std`                                                                     | The explaination can be found by features_info.txt                                                   |


# © Weijia Chen Reserves All Rights, 2014.

