dashboardPage(skin = "blue",
  dashboardHeader(
    title = "Google Play Store Apps"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text = "Info",
        tabName = "menu_info",
        icon = icon("info-circle")
      ),
      menuItem(
        text = "Main",
        tabName = "menu_dash",
        icon = icon("dashboard")
      )
    )
  ),
  
  dashboardBody(
    includeCSS("assets/css/custom.css"),
    tabItems(
      tabItem(
        tabName = "menu_info",
        fluidRow(
          div(class = "col-sm-6",
              h2("Google Play Store Apps (Latest Updated 2018)")
             ),
          div(class = "col-sm-6 btn-cus",
              actionButton("show", "Info Data"),
              verbatimTextOutput("dataInfo")
          )
        ),
        dataTableOutput(outputId = "dt_gp")
      ),
      
      tabItem(
        tabName = "menu_dash",
        h2("Dashboard"),
        plotlyOutput(outputId = "plot_1")
      )
    )
  )
)