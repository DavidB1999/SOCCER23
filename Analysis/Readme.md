This folder contains all the analysis steps that happened after the position data was imported into SOCCCER© and the Success-Scores have been created. <br>

The prefix number indicates the order dependency of the code within it. Running a file prefixed with 02 before all 01 files will most likely cause an error. Files with the same prefix can be run indepently from each other. <br>

*01_filter_11v11.ipynb* - filter the matches so that only those matches which ended with 11v11 players are included in the analyis. <br>

*02_txt_to_csv.ipynb* - converting the Success-Score data from txt to csv and into an format that is easier to handle <br>
