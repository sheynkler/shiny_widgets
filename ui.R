library(shiny)

shinyUI(fluidPage(
  titlePanel("Shiny widgets"),
  includeCSS("css/mycss.css"),
  fluidRow(
    column(4,
           selectInput("widget", label = "Widget", choices = as.list(widgetChoises)),
           selectInput("package", label = "Packages", choices = as.list(widgetPackages)),
           selectInput("data", label = "Data", choices = as.list(widgetDatas)),
           
           actionButton("draw", label = "Draw")
    ),
    column(8,
           mf_ui_placeWidget("m_name_placeWidget")
    )
  )
))
