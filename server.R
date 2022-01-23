function(input,output,session){
  
  dataTableServer("table1", occ.df)
  
   rowSel <- reactive({
     input$`table1-table_rows_selected`
   })
  
  profileServer("species", occ.df, data.occurence, multimedia.df, rowSel)
      
  dygraphsServer("mainTPlot", occ.df, data.occurence, rowSel)
  
  mapTrue <- reactive({
      validate(
        need(rowSel() != "", "Please select a species from table.")
      )
      dat <- occ.df[rowSel(),]
      spc <- dat$scientificName
      dat <- data.occurence[data.occurence$scientificName == spc,]
      dat <- merge(multimedia.df, dat, by = "gbifID", all = TRUE)
      return(dat)
    })

  leafMap("mainMap",mapTrue)
  
}