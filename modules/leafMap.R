leafMapUI <- function(id) {
  ns <- NS(id)
  tagList(
    leafletOutput(ns("map"), height = 350L)
  )
}

leafMap <- function(id, tempdf) {
  
  moduleServer(
    id,
    function(input, output, session) {
      output$map<-renderLeaflet({
        
        poland_lat <- 50.124981
        poland_lon <- 19.009438

        dat <- tempdf()
        popupCont <- paste0(
          "<strong>Scientific Name: </strong>", dat$scientificName, "<br>",
          "<strong>Latitude: </strong>", dat$latitude, "<br>",
          "<strong>Longitude: </strong>", dat$longitude, "<br>",
          "<strong>Coordinate Uncertainty (in m): </strong>",dat$coordinateUncertaintyInMeters)
        
        leaflet() %>%
          setView(lng = poland_lon, lat = poland_lat, zoom = 4.8) %>%
          addProviderTiles("Esri.WorldStreetMap") %>%
          addCircles(
            data = dat,
            radius = 20,
#            weight = 2,
            color =  ifelse(is.na(dat$identifier.x),"#A50104","#3c096c"),
            fillColor = ifelse(is.na(dat$identifier.x),"#A50104","#3c096c"),
            fillOpacity = 0.25,
            popup = ifelse(is.na(dat$identifier.x),popupCont,
                           paste0(popupCont,"<img class='img-fluid' src=",dat$identifier.x,"></img>"))
          )
      })
    })

}
