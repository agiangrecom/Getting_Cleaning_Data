Code works as follows

Downloads zip file (if needed - currently commented out as only needed once)
Unzips data (if needed - currently commented out as only needed once)
Reads in all of the train and test data
Combines data
Uses the feature name decode to get the raw names
Subsets down data to just mean() and std() columns
Decodes the activity code
Renames all columns to be descriptive (below definitions)
Data Taxonomy

Time vs Frequency - Time_ and Freq_
Body vs Gravity - Body_ and Gravity_
Acceleration and Jerk - Accel_ and Jerk_
Magnitude - Magnitude_
Mean vs Stdev - Mean_ and Std
X,Y,Z Positions - X and Y and Z
For example - Time_Body_Accel_Mean_X is the Time Body Acceleration Mean in the X direction

In addition the following columns identify information

Activity Description - Activity_Desc
Subject ID - Subject
