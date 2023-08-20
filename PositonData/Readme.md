**PositionData** <br>

This folder contains the files of the first step of the project. 
The notebooks contain all the code used to prepare the data for the import into SOCCER© and the collection of necessary information for the analysis later on. <br>

The prefix number indicates the order dependency of the code within it.
Running a file prefixed with 02 before all 01 files will most likely cause an error. Files with the same prefix can be run indepently from each other <br>


*01_Gameoverview.ipynb* - Creates in overview of the available position, event and match info data. <br>

*01_GoalLocation.ipynb* - Identification of all goals and the associated location and game phase based on the event data <br>

*01_Possession.ipynb* - Collection of the possession percentage data from FBref. 'https://fbref.com' <br>

*02_ParsetoSoccer.ipynb* - Parsing of the position data into the format required by SOCCER©. <br>

