
Background
----------
This Shiny application is the course project for Developing Data Products module.

This Shiny App is to analyst the Air Quality Index for LDG. ULU REMIS area from date 1 Aug 2013 to 5 Feb 2015. The total number of observations is 13294 with 3 variables (date, hour and the AQI reading).

Manual
------
There are two main tab at the top of this Shiny App - Data Analyst and Info. Info will show this README information and manual on how to use this Shiny App. Data Analyst will show the data analyst screen, where it read the data from aqi.csv file and display the data.

You select the data's year from dropdown box and select the month from the range slider, then the data table will display the data. If you want to see the chart, then click on the plot tab at the right panel. The default chart is point chart, if you click the "Line chart" checkbox below the chart, it will plot the smooth line chart.

The data will reactive/response when you change the data's year or month range. 

You can also disable and enable the selected AQI data mean at the left panel by select/unselect the "AQI mean" checkbox.

Project Files
-------------
Source code file (server.R and ui.R), data file (aqi.csv) and this readme.md file are available in GitHub:

https://github.com/thongtom/DevelopDataProduct

