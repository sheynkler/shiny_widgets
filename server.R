
library(shiny)

shinyServer(function(input, output, session) {
  callModule(mf_s_placeWidget, "m_name_placeWidget", widget_r, package_r, data_r, draw_r)
  widget_r <- reactive(input$widget)
  package_r <- reactive(input$package)
  data_r <- reactive(input$data)
  draw_r <- reactive(input$draw)

})