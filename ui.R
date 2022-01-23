source('userInterface/tabsUI.R')

body <- dashboardBody(
   tabItems(
    home,
    profile,
    about
    )
)

dashboardPage(
  freshTheme = create_theme(
    bs4dash_vars(
      navbar_light_color = "#D4D2D5",
      navbar_light_active_color = "#FFF",
      navbar_light_hover_color = "#FFF"
      ),
    bs4dash_layout(
      main_bg = "#FFF" 
    ),
    bs4dash_sidebar_light(
      bg = "#FFF",
      color = "#040404",
      hover_color = "#0C4767",
    ),
    bs4dash_status(
      primary = "#34a0a4", danger = "#BF616A", success = '#2a9d8f', warning = '#F7B538', info = "#fffffc"
    ),
    bs4dash_color(
      blue = '#4281A4', 
      lime = '#EBEBEB',
      white = '#fffffc'
    )
  ),
  dashboardHeader(
    fixed = TRUE,
    border = TRUE,
    navbarMenu(
      navbarTab(tabName = "home", "BioDiv Portal Poland"),
      navbarTab(tabName = "profile", "Species Profile"),
      navbarTab(tabName = "about", "About & Data"))
  ),
  sidebar,
  body,
  footer = dashboardFooter(
    left = a(
      href = "https://github.com/SamuelBharti",
      target = "_blank", "@SamuelBharti"
    ),
    right = a(
      href = "https://appsilon.com/",
      target = "_blank", HTML("<img height=35 src='img/appsilon.png'/>")
    )
  ),
  fullscreen = TRUE, dark = NULL
)