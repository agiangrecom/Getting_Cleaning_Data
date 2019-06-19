# Getting and Cleaning Data
Coursera Course for Getting and Cleaning Data

Code works as follows
1) Downloads zip file (if needed - currently commented out as only needed once)
2) Unzips data (if needed - currently commented out as only needed once)
3) Reads in all of the train and test data
4) Combines data
5) Uses the feature name decode to get the raw names
6) Subsets down data to just mean() and std() columns
7) Decodes the activity code
8) Renames all columns to be descriptive (below definitions)

Data Taxonomy
Time vs Frequency - Time_ and Freq_
Body vs Gravity - Body_ and Gravity_
Acceleration and Jerk - Accel_ and Jerk_
Magnitude - Magnitude_
Mean vs Stdev - Mean_ and Std
X,Y,Z Positions - X and Y and Z

For example - Time_Body_Accel_Mean_X is the Time Body Acceleration Mean in the X direction

Activity Description - Activity_Desc
Subject ID - Subject

