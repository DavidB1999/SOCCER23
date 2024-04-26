# SOCCER23
This repository contains all relevant scripts from the research project **"Success-Score in Professional Soccer – Is there a sweet spot in the analysis of space and ball control?"** by me David Brinkjans supported by my fellow colleagues.  This project was part of my work at the Institute of Exercise Training and Sport Informatics at the German Sport University Cologne and also my Master thesis. <br>

Feel free to check out the code. <br>

Data not included! Please be aware that the code does not work without the correct data within a folder structure that resembles the one used within these scripts. An adaptation of the code to similar data should be possible with basic Python skills based on my comments.<br>
Success-Scores have been calculated via SOCCER© - a match analysis tool developed by Jürgen Perl (Perl et al., 2013). An implementation of the Success-Score via Python or similar programming languages is also possible and a simplest proof of concept is available here: https://github.com/DavidB1999/Success-Score <br>

Data handling is done in Python (Jupyter notebooks) entirely. Some of the statistics have been conducted in R due to package / library availability. <br>
Some of the code is based on the brilliant floodlight package developed at the Institute of Exercise Training and Sport Informatics (Raabe et al., 2022). <br>
If you are interested in sports analytics I would definitely  recommend checking it out: https://floodlight.readthedocs.io/en/latest/index.html | https://github.com/floodlight-sports/floodlight <br>

There are two main folders:

*PositionData* - General Data preparation and formatting for SOCCER© <br>

*Analysis* - The analysis of the Success-Score data and related variables <br>

<br>

**Requirements.txt** list the package requirements for all scripts and can be used for *pip install* <br>

<br>


For some context on the project check out my first publications on the Success-Score. I learned a lot since then though :D <br>
DOI: https://doi.org/10.2478/ijcss-2022-0009 <br>
DOI: https://doi.org/10.2478/ijcss-2023-0013 <br>

You can also check out the original paper: <br>
DOI: https://doi.org/10.1515/ijcss-2017-0005 <br>

The publication, the product of this code, will be linked here as soon as it is published: 
https://doi.org/10.2478/ijcss-2024-0004 <br>


### References:
Brinkjans, D., Memmert, D., Imkamp, J., & Perl, J. (2022). Success-Score in Professional Soccer – Validation of a Dynamic Key Performance Indicator Combining Space Control and Ball Control within Goalscoring Opportunities. International Journal of Computer Science in Sport, 21(2), 32–42. https://doi.org/10.2478/ijcss-2022-0009 <br>
Brinkjans, D., Memmert, D., Paul, Y., & Perl, J. (2023). Success-Score in Professional Soccer – Is there a sweet spot in the analysis of space and ball control? International Journal of Computer Science in Sport, 22(2), 77–97. https://doi.org/10.2478/ijcss-2023-0013 <br>
Raabe, D., Biermann, H., Bassek, M., Wohlan, M., Komitova, R., Rein, R., Groot, T. K., & Memmert, D. (2022). floodlight—A high-level, data-driven sports analytics framework. Journal of Open Source Software, 7(76), 4588. https://doi.org/10.21105/joss.04588 <br>
Perl, J., Grunz, A., Memmert, D., & Gutenberg-University, J. (2013). Tactics Analysis in Soccer – An Advanced Approach. International Journal of Computer Science in Sport, 12. <br>
Perl, J., & Memmert, D. (2017). A Pilot Study on Offensive Success in Soccer Based on Space and Ball Control – Key Performance Indicators and Key to Understand Game Dynamics. International Journal of Computer Science in Sport, 16(1), 65–75. https://doi.org/10.1515/ijcss-2017-0005 <br>

