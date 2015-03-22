Description of Script
The "run_analysis" script can be used to obtain tidy data from a set of raw data files. Each observation in tidy data set is mean of features data per each Subject and Activity.
There are two sets of data 
	1)test data
	2)train data

Assumptions
	1) Script assumes that files are available in working directory. For example if "C:\UCI HAR Dataset" is the working directory, expected location of raw files is written between brackets.
	2) "dplyr" package is installed. (Loading of package will be handled by the script)
	3) Columns containing "mean" or "Mean" or "std" in the "x_tarin.txt" and "x_test.txt" are considereed (86 such columns are there) 

Input files

	Raw data files expected by the scripts are
		1)Subject  (/train/subject_train.txt, /test/subject_test.txt)
		2)Activity  (/train/y_train.txt, /test/y_test.txt)
		3)Feature values for each subject (/train/x_train.txt, /test/x_test.txt)

	Script also require
		1)Features - Column names of tidy data. (features.txt)
		2)activity_labels.txt - Lables which will be used to describe activity of each subject (column2 of tidy data set)
Output
	Output produced by the script satisfies the principals of tidy data since it contains one observation(row) for each subject and activity. Each column represent mean of distinct features. Names of columns are descriptive. Please refer codebook.txt for understanding naming convention os variables.
	Tidy data is written into "tidydata.txt" in working directory.
	
Steps from Input to Output
	1 Load dplyr package into R
	2 Read column names (features.txt)
	3)Read Activity lables (activity_lables.txt)
	4)Read train data set (subject_train.txt, y_train, x_train.txt) and bind them together using cbind(column bind) - we have complete train data set in one table. (traindata in script)
	5)Read test data set (subject_test.txt, y_test, x_test.txt) and bind them together using cbind(column bind) - we have complete test data set in one table. (testdata in script)
	6) Merge the train and test data from step 4 and 5 into signle table (mergedata in script). Mergedata is complete dataset having measurements for all the mean and standard deviations for all the subject and activities.
	7) Mergedata till now has activity as numeric. Map it to Activity lables from activity_lables by usingfactors and level.
	8) Group mergedata by Subject and Activity
	9) Summarise each observation - mean function to calculate mean of each observation by each subject and activity.
	10) Write final dataset(step5data) into tidydata.txt in working directory.
	
	
	
	




