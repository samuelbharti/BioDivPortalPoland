# BioDivPortal
Bio Diversity Portal for Poland is an R Shiny application developed as part of the appsilon hiring process. The application display information on various species observed in Poland. The data is collected from [GBIF](https://www.gbif.org/).

===

Features of BioDivPortal:

* Search or/and Select a species from curated table powered by DataTable library.
* Visualize the occurence of that species on the map powered by Leaflet library. 
* Purple points indicate an image is present whereas as red indicates it is not.
* A popup displays Scientific Name, Latitude, Longitude, Uncertainity of Coordinates (in m) and image if present.
* In next row the users can also observe timeline of occurences of that species with individual counts observed on each event. This is powered by dygraphs Library.
* Once a species is selected user can also move to next tab/section **Species Profile** from navbar menu to gather complete information of selected species along a image gallery.
* When no species is selected the app displays a message "Please select a species from table".
* Lastly there is tab with about section and download section where users can learn about BioDivPortal and download data used in (zip) respectively.
* The user can also use application in fullscreen mode. 

---

Technical Features:

* App is constructed in components i.e. having external scripts stored userInterface and modules folder. 
* Table, Map, Timeline Plot and Profile Section are made using Shinymodules and can be found in modules folder.
* External CSS, IMG used can be found in WWW folder.
* R version used: 4.1.1

---

Hosting:
Performance may very due to usage of free hosting. 

1. Shinyapps.io: [https://samuelbharti.shinyapps.io/BioDivPortal/](https://samuelbharti.shinyapps.io/BioDivPortal/)
2. Docker Image: [samuelbharti/biodivportal](https://hub.docker.com/repository/docker/samuelbharti/biodivportal) 
3. AWS Hosted: [Click Here](http://ec2-3-14-152-196.us-east-2.compute.amazonaws.com/)
   `AWS hosted can be slow since it's on t2.micro`
