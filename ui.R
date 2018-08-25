library(shiny)

shinyUI(fluidPage(
  titlePanel("Shiny widgets"), hr(),
  includeCSS("css/mycss.css"),
  fluidRow(
    column(2,
           radioButtons("first", label = "First choice", choices = list("Widget" = 1, "Package" = 2), inline = T),
           hr(),
           selectInput("widget", label = "Widget", choices = as.list(widgetChoises)),
           selectInput("package", label = "Packages", choices = as.list(widgetPackages)),
           #selectInput("data", label = "Data", choices = as.list(widgetDatas)),
           
           actionButton("draw", label = "Draw")
    ),
    column(10,
           mf_ui_placeWidget("m_name_placeWidget")
    )
  )
))
