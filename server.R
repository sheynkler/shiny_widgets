

library(shiny)

shinyServer(function(input, output, session) {
  callModule(mf_s_placeWidget,
             "m_name_placeWidget",
             widget_r,
             package_r,
             #data_r,
             draw_r)
  widget_r <- reactive(input$widget)
  package_r <- reactive(input$package)
  draw_r <- reactive(input$draw)
  
  observeEvent(input$first, {
    if (input$first == 1)
      updateSelectInput(session,
                        "widget",
                        label = "Widgets",
                        choices = unique(dataWidgets$widget))
    else
      updateSelectInput(session,
                        "package",
                        label = "Packages",
                        choices = unique(dataWidgets$package))
  })
  
  
  
  observeEvent(input$widget, {
    if (input$first == 1) {
      updateSelectInput(
        session,
        "package",
        label = paste("Packages for", input$widget),
        choices = unique(dataWidgets$package[dataWidgets$widget == input$widget])
      )
      
    }
  })
  
  observeEvent(input$package, {
    if (input$first == 2) {
      updateSelectInput(
        session,
        "widget",
        label = paste("Widgets for", input$package),
        choices = unique(dataWidgets$widget[dataWidgets$package == input$package])
      )
      
    }
  })

  
  
})