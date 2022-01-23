profileUI <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("profile"))
  )
}

profileServer <- function(id, occ.df, data.occurence, multimedia.df, rowSel) {
  moduleServer(id, function(input, output, session) {
    output$profile <- renderUI({
      validate(
        need(rowSel() != "", "Please select a species from table.")
      )
      dat <- occ.df[rowSel(),]
      spc <- dat$scientificName
      dat <- data.occurence[data.occurence$scientificName == spc,]
      src1 <- multimedia.df$identifier[multimedia.df$gbifID %in% dat$gbifID]
      k <- matrix(1:120, nrow = 30,ncol = 4, byrow = TRUE)
      return(
        div(
          h2(spc),
          HTML(
            "	<div class='tg'><table style='width: 60%'>
					<tr>
						<td class='tg-1wig'>Verbatim Scientific Name:</td>
						<td class='tg-0lax'>",dat$verbatimScientificName[1],"</td>
					</tr>
					<tr>
						<td class='tg-1wig'>Vernacular Name:</td>
						<td class='tg-0lax'>",dat$vernacularName[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Higher Classification:</td>
						<td width='60%' class='tg-0lax'>",dat$higherClassification[1],"</td>
					</tr>
					<tr>
						<td width='40%' class='tg-1wig'>Kingdom:</td>
						<td width='60%' class='tg-0lax'>",dat$kingdom[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Phylum:</td>
						<td width='60%' class='tg-0lax'>",dat$phylum[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Class:</td>
						<td width='60%' class='tg-0lax'>",dat$class[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Order:</td>
						<td width='60%' class='tg-0lax'>",dat$order[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Family:</td>
						<td width='60%' class='tg-0lax'>",dat$family[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Genus:</td>
						<td width='60%' class='tg-0lax'>",dat$genus[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Species:</td>
						<td width='60%' class='tg-0lax'>",dat$species[1],"</td>
					</tr>
						<tr>
						<td width='40%' class='tg-1wig'>Locality:</td>
						<td width='60%' class='tg-0lax'>",dat$locality[1],"</td>
					</tr>
        </table></div>"
          ),
          br(),
          h3(class="text-center border text-white", style ="background-color:#34a0a4;","IMAGE GALLERY"),
          lapply(1:ceiling(length(src1)/4), function (i){
            fluidRow(
              column(3,tags$img(src = src1[k[i,1]],class="pimg img-fluid border rounded")),
              column(3,tags$img(src = src1[k[i,2]],class="pimg img-fluid border rounded")),
              column(3,tags$img(src = src1[k[i,3]],class="pimg img-fluid border rounded")),
              column(3,tags$img(src = src1[k[i,4]],class="pimg img-fluid border rounded"))
            )
          })
        )
      )
    })
    
  })
}