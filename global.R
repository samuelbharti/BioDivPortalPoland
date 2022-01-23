library(bs4Dash)
library(shiny)
library(shinyWidgets)
library(fresh)
library(DT)
library(htmltools)
library(dplyr)
library(shinybusy)
library(leaflet)
library(data.table)
library(dygraphs)
library(xts)


source("modules/leafMap.R")
source("modules/dataTable.R")
source("modules/dyGraph.R")
source("modules/profile.R")

options(warn=-1)
multimedia.df <- fread('www/data/multimedia.txt', header = TRUE)
occurence.df <- fread('www/data/occurrence.txt', header = TRUE)
data.occurence <- occurence.df
allmisscols <- sapply(data.occurence, function(x) all(is.na(x)))
colsel <- c()
for(i in 1:length(allmisscols)){
  if(!allmisscols[i]){
    colsel <-  append(colsel,names(allmisscols)[i])
  }
}
data.occurence <- occurence.df[,..colsel]
names(data.occurence)[names(data.occurence) == 'decimalLongitude'] <- 'longitude'
names(data.occurence)[names(data.occurence) == 'decimalLatitude'] <- 'latitude'
occ.df <- data.occurence %>%
  group_by(scientificName) %>%
  distinct(species,vernacularName)


