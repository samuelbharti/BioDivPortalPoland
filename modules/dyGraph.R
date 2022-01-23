dygraphsUI <- function(id) {
  ns <- NS(id)
  tagList(
    dygraphOutput(ns("dyg"), height = 250L)
  )
}

dygraphsServer <- function(id,tempdf1, tempdf2, rowSel ) {
  
  moduleServer(id, function(input, output, session) {
    
    output$dyg <- renderDygraph({
      validate(
        need(rowSel() != "", "Please select a species from table."))
      dat <- tempdf1[rowSel(),]
      spc <- dat$scientificName 
      
      x <- tempdf2$eventDate[tempdf2$scientificName == spc]
      y <- tempdf2$individualCount[tempdf2$scientificName == spc]
      dydat <-  data.frame('x' = x,'y' =y)
      dydat <- xts(dydat$y , dydat$x)
      dygraph(dydat, main = paste0("Species Occurences || Total Occurences:",length(x)),xlab = "Date", ylab = "Individual Count") %>%
        dySeries("V1", label = "Observed", color = '#34a0a4', strokeWidth = 2) %>%
        dyOptions(drawPoints = FALSE, pointSize = 2,fillGraph=TRUE) %>%
        dyRangeSelector(height = 20)
      
    })
  })
}