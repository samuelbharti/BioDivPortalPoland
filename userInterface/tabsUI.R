sidebar <- dashboardSidebar(
  disable = TRUE,
  skin = "light",
)

navbarTab <- function(tabName, ..., icon = NULL) {
  tags$li(
    class = "nav-item",
    tags$a(
      class = "nav-link",
      id = paste0("tab-", tabName),
      href = paste0("#shiny-tab-", tabName),
      `data-toggle` = "tab",
      `data-value` = tabName,
      icon,
      tags$p(...)
    )
  )
}

navbarMenu <- function(..., id = NULL) {
  if (is.null(id)) id <- paste0("tabs_", round(stats::runif(1, min = 0, max = 1e9)))
  
  tags$ul(
    class = "navbar-nav dropdown sidebar-menu", 
    role = "menu",
    ...,
    div(
      id = id,
      class = "sidebarMenuSelectedTabItem",
      `data-value` = "null",
      
    )
  )
}


home <- tabItem(tabName = "home",
                    fluidRow(
                      tags$head(
                        tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")),
                      column(6,
                             class = "border rounded p-2",
                             add_busy_bar(),
                             dataTableUI("table1")
                      ),
                      column(6,  class = "border rounded p-2",
                             leafMapUI('mainMap'))
                      ),
                    br(),
                    hr(),
                    fluidRow(
                      column(12,dygraphsUI('mainTPlot'))
                    ),
)


profile <- tabItem(tabName = "profile",
        fluidRow(
          column(12, 
                 profileUI("species"))
        )
)

about <- tabItem(tabName = "about",
        fluidRow(
          column(3,),
          column(6,
                 class ='text-center',
                 HTML("<h4>About BioDiv Portal Poland</h4>"),
                 div(style = "text-align:justify",
                     HTML("<p>
                                   This application is designed to interactively visualize Biodiversity data of Poland 
                                   collected by <a target='_blank' href='https://www.gbif.org/'>GBIF: the Global Biodiversity Information Facility </a>
                                   Source code and additional information for this application are available 
                                   via the <a target='_blank' href='https://github.com/samuelbharti/BioDivPortalPoland'>
                                   BioDiv Portal Poland GitHub repository</a>. 
                                   This application is available under an MIT license.
                                      </p>")),
                 br(),
                 div(class = "text-center;", 
                     HTML('<h4>Download Dataset (zip)</h4><p>'),
                     a(href="dataJan24.zip", "Click here", download=NA, target="_blank"),
                     HTML('to download dataset used in this application.</p>'), 
                     
                     
                 )
          ),
          column(3,)
          
        )
)


