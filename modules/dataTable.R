dataTableUI <- function(id) {
  ns <- NS(id)
  tagList(
    dataTableOutput(ns("table"), height = 320L)
  )
}

dataTableServer <- function(id, tempdf) {
  moduleServer(id, function(input, output, session) {
    output$table <- renderDT({
      return(
        datatable(tempdf, selection = 'single',
                  colnames = list("Scientific Name","Vernacular Name","Species"),
                  extensions = c('Responsive'),
                  style = "bootstrap4",
                  options = list(pageLength = 5,
                                 bLengthChange=0,
                                 responsive = TRUE
                  ))
      )
    })
  })
}
