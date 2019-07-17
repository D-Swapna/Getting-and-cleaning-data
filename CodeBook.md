# Code book for *Getting and Cleaning Data* course project

The data set that this code book pertains to is located in the `tidyData.txt` file of this repository.

See the `README.md` file of this repository for brief details on the project.

The structure of the data set is described in the Data section, its variables are listed in the variables section, and the transformations made to obtain the data set based on the source data are presented in the transformations section.

## Data

The `tidyData.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables. 

Each row contains, for a given subject and activity, 67 averaged signal measurements.

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, string with 6 possible values: 
	- `WALKING`
	- `WALKING_UPSTAIRS`
	- `WALKING_DOWNSTAIRS`
	- `SITTING`
	- `STANDING`
	- `LAYING`

- Time-domain signals (variables prefixed by `Time Domain`)

- Frequency-domain signals (variables prefixed by `Frequency Domain`)

#### Time-domain signals

	- `Time Domain Body Accelerator Mean-X`
	- `Time Domain Body Accelerator Mean-Y`
	- `Time Domain Body Accelerator Mean-Z`
	- `Time Domain Body Accelerator Standard Deviation-X`
	- `Time Domain Body Accelerator Standard Deviation-Y`
	- `Time Domain Body Accelerator Standard Deviation-Z`
	- `Time Domain Gravity Accelerator Mean-X`
	- `Time Domain Gravity Accelerator Mean-Y`
	- `Time Domain Gravity Accelerator Mean-Z`
	- `Time Domain Gravity Accelerator Standard Deviation-X`
	- `Time Domain Gravity Accelerator Standard Deviation-Y`
	- `Time Domain Gravity Accelerator Standard Deviation-Z`
	- `Time Domain Body Accelerator Jerk Mean-X`
	- `Time Domain Body Accelerator Jerk Mean-Y`
	- `Time Domain Body Accelerator Jerk Mean-Z`
	- `Time Domain Body Accelerator Jerk Standard Deviation-X`
	- `Time Domain Body Accelerator Jerk Standard Deviation-Y`
	- `Time Domain Body Accelerator Jerk Standard Deviation-Z`
	- `Time Domain Body Gyroscope Mean-X`
	- `Time Domain Body Gyroscope Mean-Y`
	- `Time Domain Body Gyroscope Mean-Z`
	- `Time Domain Body Gyroscope Standard Deviation-X`
	- `Time Domain Body Gyroscope Standard Deviation-Y`
	- `Time Domain Body Gyroscope Standard Deviation-Z`
	- `Time Domain Body Gyroscope Jerk Mean-X`
	- `Time Domain Body Gyroscope Jerk Mean-Y`
	- `Time Domain Body Gyroscope Jerk Mean-Z`
	- `Time Domain Body Gyroscope Jerk Standard Deviation-X`
	- `Time Domain Body Gyroscope Jerk Standard Deviation-Y`
	- `Time Domain Body Gyroscope Jerk Standard Deviation-Z`
	- `Time Domain Body Accelerator Magnitude Mean`
	- `Time Domain Body Accelerator Magnitude Standard Deviation`
	- `Time Domain Gravity Accelerator Magnitude Mean`
	- `Time Domain Gravity Accelerator Magnitude Standard Deviation`
	- `Time Domain Body Accelerator Jerk Magnitude Mean`
	- `Time Domain Body Accelerator Jerk Magnitude Standard Deviation`
	- `Time Domain Body Gyroscope Magnitude Mean`
	- `Time Domain Body Gyroscope Magnitude Standard Deviation`
	- `Time Domain Body Gyroscope Jerk Magnitude Mean`
	- `Time Domain Body Gyroscope Jerk Magnitude Standard Deviation`
	
#### Frequency-domain signals
	
	- `Frequency Domain Body Accelerator Mean-X`
	- `Frequency Domain Body Accelerator Mean-Y`
	- `Frequency Domain Body Accelerator Mean-Z`
	- `Frequency Domain Body Accelerator Standard Deviation-X`
	- `Frequency Domain Body Accelerator Standard Deviation-Y`
	- `Frequency Domain Body Accelerator Standard Deviation-Z`
	- `Frequency Domain Body Accelerator Jerk Mean-X`
	- `Frequency Domain Body Accelerator Jerk Mean-Y`
	- `Frequency Domain Body Accelerator Jerk Mean-Z`
	- `Frequency Domain Body Accelerator Jerk Standard Deviation-X`
	- `Frequency Domain Body Accelerator Jerk Standard Deviation-Y`
	- `Frequency Domain Body Accelerator Jerk Standard Deviation-Z`
	- `Frequency Domain Body Gyroscope Mean-X`
	- `Frequency Domain Body Gyroscope Mean-Y`
	- `Frequency Domain Body Gyroscope Mean-Z`
	- `Frequency Domain Body Gyroscope Standard Deviation-X`
	- `Frequency Domain Body Gyroscope Standard Deviation-Y`
	- `Frequency Domain Body Gyroscope Standard Deviation-Z`
	- `Frequency Domain Body Accelerator Magnitude Mean`
	- `Frequency Domain Body Accelerator Magnitude Standard Deviation`
	- `Frequency Domain Body Accelerator Jerk Magnitude Mean`
	- `Frequency Domain Body Accelerator Jerk Magnitude Standard Deviation`
	- `Frequency Domain Body Gyroscope Magnitude Mean`
	- `Frequency Domain Body Gyroscope Magnitude Standard Deviation`
	- `Frequency Domain Body Gyroscope Jerk Magnitude Mean`
	- `Frequency Domain Body Gyroscope Jerk Magnitude Standard Deviation`

## Transformations

The following transformations are applied to the source data:

1. The training and test sets were merged to create one data set.
2. The measurements on the mean and standard deviation (i.e. variables containing the strings `mean` and `std`) are extracted for each measurement.
3. The activity IDs (1-6) are replaced with descriptive activity names.
4. The variable names are replaced with descriptive variable names (e.g. `tBodyAcc-mean()-X` converted to `Time Domain BodyAccelerometer Mean-X`)
5. From the data set in step 4, the final data set is created with the average of each variable for each activity and each subject.