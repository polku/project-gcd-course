CodeBook.md
==========================================================

Project for the coursera course "Getting and cleaning data" https://class.coursera.org/getdata-003
05/2014
Jonathan MAURICE
Raw data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R constructs a tidy data set, from the raw data, following those steps :

* read the train/X_train.txt, train/subject_train.txt, y_train.txt, test/X_test.txt, test/subject_test.txt (subject id), test/y_test.txt (activity id)
* the files in train/Inertial Signals and test/Inertial Signals are ignored
* combine the files to get one set of 10299 rows and 563 columns
* name the columns using the content of the file features.txt
* only keep the columns related to mean or std of values, plus the subject and activity values
* precision : some columns have "Mean" in their names but they aren't included, because they aren't measures (meanFreq or angle)
* the set has now 10299 rows and 68 columns
* the "activity id" is replaced with the corresponding activity name found in activity_labels.txt
* the names of columns are slightly modified, to suppress the "-()" characters and "BodyBody" that appears in some names
* the final tidy data set keeps 68 columns and has 180 rows, each row corresponds to the means of each variable for each subject and each activity
* the set is saved in tidy_data.txt, which can be loaded as a csv file with " " as separator

The 68 columns in the set are :

1. tBodyAccMeanX
2. tBodyAccMeanY
3. tBodyAccMeanZ
4. tBodyAccStdX
5. tBodyAccStdY
6. tBodyAccStdZ
7. tGravityAccMeanX
8. tGravityAccMeanY
9. tGravityAccMeanZ
10. tGravityAccStdX
11. tGravityAccStdY
12. tGravityAccStdZ
13. tBodyAccJerkMeanX
14. tBodyAccJerkMeanY
15. tBodyAccJerkMeanZ
16. tBodyAccJerkStdX
17. tBodyAccJerkStdY
18. tBodyAccJerkStdZ
19. tBodyGyroMeanX
20. tBodyGyroMeanY
21. tBodyGyroMeanZ
22. tBodyGyroStdX
23. tBodyGyroStdY
24. tBodyGyroStdZ
25. tBodyGyroJerkMeanX
26. tBodyGyroJerkMeanY
27. tBodyGyroJerkMeanZ
28. tBodyGyroJerkStdX
29. tBodyGyroJerkStdY
30. tBodyGyroJerkStdZ
31. tBodyAccMagMean
32. tBodyAccMagStd
33. tGravityAccMagMean
34. tGravityAccMagStd
35. tBodyAccJerkMagMean
36. tBodyAccJerkMagStd
37. tBodyGyroMagMean
38. tBodyGyroMagStd
39. tBodyGyroJerkMagMean
40. tBodyGyroJerkMagStd
41. fBodyAccMeanX
42. fBodyAccMeanY
43. fBodyAccMeanZ
44. fBodyAccStdX
45. fBodyAccStdY
46. fBodyAccStdZ
47. fBodyAccJerkMeanX
48. fBodyAccJerkMeanY
49. fBodyAccJerkMeanZ
50. fBodyAccJerkStdX
51. fBodyAccJerkStdY
52. fBodyAccJerkStdZ
53. fBodyGyroMeanX
54. fBodyGyroMeanY
55. fBodyGyroMeanZ
56. fBodyGyroStdX
57. fBodyGyroStdY
58. fBodyGyroStdZ
59. fBodyAccMagMean
60. fBodyAccMagStd
61. fBodyAccJerkMagMean
62. fBodyAccJerkMagStd
63. fBodyGyroMagMean
64. fBodyGyroMagStd
65. fBodyGyroJerkMagMean
66. fBodyGyroJerkMagStd
67. subject
68. activity
