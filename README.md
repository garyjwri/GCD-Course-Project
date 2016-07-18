# Getting and Cleaning Data Course Project

## Description of the raw data

Refer to the code book (CodeBook.md).

## Steps performed by run_analysis.R

The test dataset contains 2947 observations and the train dataset contains 7352 observations of 561 variables. The script first merges the test and train datasets to create a dataset with 10299 observations. Next, out of the 561 variables, the script selects 66 variables that contain the mean and standard deviation of each variable. **The script _does not_ keep the mean frequencies as mean frequencies are _not_ mentioned in the project instructions.** (For more details, refer to the code book.) After this, the subject and the activity markers are appended as first and second columns, producing an intermediate data frame of 10299 rows and 68 columns (66+2).

From this data frame, the script produces the final tidy dataset. Since there are 30 subjects and 6 activities (walking, walking upstairs, walking downstairs, sitting, standing, laying), there are 180 subject-activity pairs (Subject 1 walking, Subject 1 walking upstairs... all the way to Subject 30 laying). For each subject-activity pair, the average of the 66 chosen variables are calculated. The subject and activity again appear in the first and second columns, rather than as row names. This results in a data frame of 180 rows and 68 columns, which the script outputs as a data frame named tidy_data. Finally, the script prints tidy_data to a "tidy.txt" file in the working directory using `write.table`.

To read in the submitted .txt file using `read.table`, please set header=TRUE.
