This folder contains all the analysis steps that happened after the position data was imported into SOCCCER© and the Success-Scores have been created. <br>

The prefix number indicates the order dependency of the code within it. Running a file prefixed with 02 before all 01 files will most likely cause an error. Files with the same prefix can be run indepently from each other. <br>

*01_filter_11v11.ipynb* - filter the matches so that only those matches which ended with 11v11 players are included in the analyis. <br>

*02_txt_to_csv.ipynb* - converting the Success-Score data from txt to csv and into an format that is easier to handle <br>

*03_minus_to_zero.ipynb* - converting all Success-Scores <0  to 0 <br>

*04_percentile_calculation.ipynb* - excluding all Success-Scores > 100 and sorting into percentile groups <br>

*05_goals.ipynb* - distribute goals into the associated percentile groups <br>

*06_Kendall.ipynb* - Kendall's tau on goals in 8 percentile groups <br>

*06_ChiSquare.ipynb* - Chi-square test on goals above and below the $80^{th}$ percentile <br>

*06_MLM_prep.ipynb* - Preperation of variables for mixed linear models and descriptives of Success-Score match averages differences <br>

*07_Descriptives.ipynb* - Descriptive statistics and visualization <br>

*08_MLM.Rmd* - R-markdown file with model building process. <br>
