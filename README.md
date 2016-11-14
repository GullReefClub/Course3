# Final Assignment: Getting and Cleaning Data

This repository is meant to hold the solution to the Week 4 peer graded assingment.

As much detail has I have on the study that generated the data are located in the readme that
comes with the download from the URL provided below.

## Installation

Having R is required. RStudio is strongly recommended! You should also have software to extract compressed (.zip)
files.

Please download the source files from:
  
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Extract the contents to your R working directory and navigate to the top level folder extracted
from the download setting that as the new working directory. 

The extracted folder is initially named "UCI HAR Dataset". In my case I renamed it 
because I do not like spaces in my paths. Further navigation is handled in the code I provided.

Your working directory should contain two subfolders, "Test" and "Train" and a file called
"activity_labels.txt" and "features.txt". There will be others, but these are the important 
ones.

In addition to this readme there is a CodeBook.txt file which contains what I know of the variables used. I was not able to determine the units of measure for the variables. As such, the codebook is largely simply a copy of information given in the download with the addition of the variables I introduced by merging files and explicitly renaming. 
## Usage

Please examine the output file provided, "labmeans.csv" to answer any questions about 
the tidiness of the data.

I believe that the tidiness criterea are met in that each variable has its own column, each row
is a set of related observations. An argument might be made that placing the catagorical 
variables for activity names and subjects should be either in their own table or pivoted, but 
our directions explicitly say to merge them with the measurements. As to pivoting, I see no 
advantage to this as it strikes me as more likely that an analyst would want to unpivot such
data than to pivot what I provided.

The file "RSCRIPT.R" contains the code to generate the output. I recommend executing it line by
line. Most lines have individual comments, and this will elucidate how the data were processed.

## Contributing

Please do not try to contribute to this repository.

## Credits

Thanks to my instructors from Johns Hopkins and my fellow students.