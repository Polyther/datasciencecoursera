# Interpretations on the run_analysis.R file

The steps the file will take to complete the data-tidying task are as follows, including 5 parts totally:

1. read those targeted files into R and merge them into one data set, which is named 'data1'; 

2.open features.txt file in the package to make sure which variables are related with mean() or std() and then specify the positions corresponding to field names of data1 file;
  extract specified variables in data1 to generate data2 file;
  
3.change activity IDs in data2 with the corresponding activity names from activity_labels.txt file ;

4.read the features.txt file into R and select the related values coherent to the positions confirmed in part2 above; use these values as descriptive ones to name data2 columns;

5:create a last tidy data set by using summarise_each() function to calculate the average values of each variables, grouping first by subject ID and then by activities. 

e
