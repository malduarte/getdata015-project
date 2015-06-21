
### Original data:

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Data Transformation Steps

 `run_analysis.R` script see 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
4. Melt the dataset by specifying ActivityID, ActivityLabel and SubjectID as the ID variables.
5. Aggregate `mean` as the aggregator function.
6. Save the result in a file s `tidy.txt`


### Variable Descriptions

Please refer to the README.txt file the original [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The set of variables that were estimated from these signals are:
- mean: Mean value
- StandardDeviation: Standard deviation

#### Data Columns

1. **ActivityLabel**: Activity being performed by the subject identified by **SubjectID**
2. **SubjectID**: Subject that performed the activity **ActivityLabel**
3. tBodyAccMeanX
4. tBodyAccMeanY
5. tBodyAccMeanZ
6. tBodyAccStandardDeviationX
7. tBodyAccStandardDeviationY
8. tBodyAccStandardDeviationZ
9. tGravityAccMeanX
10. tGravityAccMeanY
11. tGravityAccMeanZ
12. tGravityAccStandardDeviationX
13. tGravityAccStandardDeviationY
14. tGravityAccStandardDeviationZ
15. tBodyAccJerkMeanX
16. tBodyAccJerkMeanY
17. tBodyAccJerkMeanZ
18. tBodyAccJerkStandardDeviationX
19. tBodyAccJerkStandardDeviationY
20. tBodyAccJerkStandardDeviationZ
21. tBodyGyroMeanX
22. tBodyGyroMeanY
23. tBodyGyroMeanZ
24. tBodyGyroStandardDeviationX
25. tBodyGyroStandardDeviationY
26. tBodyGyroStandardDeviationZ
27. tBodyGyroJerkMeanX
28. tBodyGyroJerkMeanY
29. tBodyGyroJerkMeanZ
30. tBodyGyroJerkStandardDeviationX
31. tBodyGyroJerkStandardDeviationY
32. tBodyGyroJerkStandardDeviationZ
33. tBodyAccMagMean
34. tBodyAccMagStandardDeviation
35. tGravityAccMagMean
36. tGravityAccMagStandardDeviation
37. tBodyAccJerkMagMean
38. tBodyAccJerkMagStandardDeviation
39. tBodyGyroMagMean
40. tBodyGyroMagStandardDeviation
41. tBodyGyroJerkMagMean
42. tBodyGyroJerkMagStandardDeviation
43. fBodyAccMeanX
44. fBodyAccMeanY
45. fBodyAccMeanZ
46. fBodyAccStandardDeviationX
47. fBodyAccStandardDeviationY
48. fBodyAccStandardDeviationZ
49. fBodyAccJerkMeanX
50. fBodyAccJerkMeanY
51. fBodyAccJerkMeanZ
52. fBodyAccJerkStandardDeviationX
53. fBodyAccJerkStandardDeviationY
54. fBodyAccJerkStandardDeviationZ
55. fBodyGyroMeanX
56. fBodyGyroMeanY
57. fBodyGyroMeanZ
58. fBodyGyroStandardDeviationX
59. fBodyGyroStandardDeviationY
60. fBodyGyroStandardDeviationZ
61. fBodyAccMagMean
62. fBodyAccMagStandardDeviation
63. fBodyBodyAccJerkMagMean
64. fBodyBodyAccJerkMagStandardDeviation
65. fBodyBodyGyroMagMean
66. fBodyBodyGyroMagStandardDeviation
67. fBodyBodyGyroJerkMagMean
68. fBodyBodyGyroJerkMagStandardDeviation
