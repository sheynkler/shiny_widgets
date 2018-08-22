########## Legende
# mf_ui   module for ui
# m_name  namespacefor module
# mf_s_    module for server
# m_id_ module id


# UI:     mf_ui_placeWidget("m_name_placeWidget")
# Server: callModule(mf_s_placeWidget, "m_name_placeWidget")
# Global: source("module/module_placeWidget.R")

mf_ui_placeWidget <- function(id) {
  ns <- NS(id)
  tagList(fluidRow(column(6,
                          div(
                            id = "titel_div",
                            h2(textOutput(ns("title")))
                          )),
                   column(
                     6,
                     div(id = "code_titel_div",
                         h3("Code")
                         ),
                     aceEditor(
                       "code",
                       mode = "r",
                       value = code_server_sankey_flipPlots,
                       #mode = "r",
                       height = "100px"
                     )
                   )))
  
  
}

mf_s_placeWidget <-
  function(input,
           output,
           session,
           widget_r,
           package_r,
           data_r,
           draw_r) {
    DATA <- reactiveValues()
    DATA$ui <- NULL
    DATA$title <- NULL
    DATA$code <- code_server_sankey_flipPlots
    
    output$code <- renderUI({
      HTML(DATA$code)
    })
    
    output$plot_sankey_flipPlots <-
      draw_sankey_flipPlots(input, output, session, mydata_r)
    output$plot_table_dataTable <-
      draw_table_dataTable(input, output, session, mydata_r)
    
    observeEvent(draw_r(), {
      place_id <- paste("plot", widget_r(), package_r(), sep = "_")
      output_function <-
        paste("output", widget_r(), package_r(), sep = "_")
      print(place_id)
      removeUI(DATA$ui)
      insertUI(selector = "#titel_div",
               where = "afterEnd",
               ui = tagList(if (exists(output_function))
                 do.call(
                   output_function, list(input, output, session, id = place_id)
                 )))
      DATA$ui <- paste0("#m_name_placeWidget-", place_id)
      row_widget <- row_widget_r()
      DATA$title <- row_widget$title[1]
    })
    
    row_widget_r <- reactive({
      widget <- widget_r()
      package <- package_r()
      row <-
        dataWidgets[dataWidgets$widget == widget &
                      dataWidgets$package == package, ]
    })
    output$title <- renderText({
      # row_widget <- row_widget_r()
      # row_widget$title[1]
      DATA$title
    })
    mydata_r <- reactive({
      eval(parse(text = data_r()))
    })
  }
