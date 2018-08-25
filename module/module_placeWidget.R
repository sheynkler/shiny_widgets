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
                          div(id = "widget_tutorial_div",
                              h4("Hier wird Widget angezeigt")
                          ),
                          div(
                            id = "titel_div",
                            h3(textOutput(ns("title")))
                          )),
                   column(
                     6,

                     h4("Server:"),
                     uiOutput(ns("ui_code_server")),
                     h4("UI:"),
                     uiOutput(ns("ui_code_ui"))#,
                     #uiOutput(ns("ui_code_ui2")),
                     # h4("Data:"),
                     # tableOutput(ns("data"))
                   )))
  
  
}

mf_s_placeWidget <-
  function(input,
           output,
           session,
           widget_r,
           package_r,
           #data_r,
           draw_r) {
    DATA <- reactiveValues()
    DATA$ui <- NULL
    DATA$title <- NULL
    DATA$code_server <- "Hier wird server Code angezeigt"
    DATA$code_ui <- "Hier wird UI Code angezeigt"

    
    output$ui_code_server <- renderUI({
      
      aceEditor(
        "code_server",
        mode = "r",
        value = DATA$code_server,
        #mode = "r",
        height = "200px"
      )
    })
    
    output$ui_code_ui <- renderUI({
      # output_function <-
      #   paste("output", widget_r(), package_r(), sep = "_")
      # output_function <- eval(parse(text = output_function))
      aceEditor(
        "code_ui",
        mode = "r",
        value = DATA$code_ui,
        #mode = "r",
        height = "100px"
      )
    })
    # output$ui_code_ui2 <- renderUI({
    #   HTML(print(print))
    # })
    
    for(i in 1:nrow(dataWidgets)){
      place_id <- paste("plot", dataWidgets$widget[i], dataWidgets$package[i], sep = "_")
      draw_function <- paste("draw", dataWidgets$widget[i], dataWidgets$package[i], sep = "_")
      output[[place_id]] <- do.call(draw_function, list(input, output, session))
      
      # output[["plot_sankey_flipPlots"]] <- do.call("draw_sankey_flipPlots", list(input, output, session))
      # output[["plot_table_dataTable"]] <- do.call("draw_table_dataTable", list(input, output, session))

    }
    

    # output$plot_sankey_flipPlots <- draw_sankey_flipPlots(input, output, session)
    
    # output$plot_table_dataTable <- draw_table_dataTable(input, output, session)
    
    observeEvent(draw_r(), {
      
      #DATA$data_to_draw <- eval(parse(text = data_r()))
      
      place_id <- paste("plot", widget_r(), package_r(), sep = "_")
      #code_var_server <- paste("code_server", widget_r(), package_r(), sep = "_")
      draw_function <-
        paste("draw", widget_r(), package_r(), sep = "_")
      DATA$code_server <- paste(deparse(eval(parse(text = draw_function))), collapse = "\n")
      print(DATA$code_server)
      
      #code_var_ui <- paste("code_ui", widget_r(), package_r(), sep = "_")
      
      #DATA$data <- mydata_r()
      output_function <-
        paste("output", widget_r(), package_r(), sep = "_")
      DATA$code_ui <- deparse(eval(parse(text = output_function)))
      
      removeUI(DATA$ui)
      removeUI("#widget_tutorial_div")
      removeUI("#code_tutorial_div")
      insertUI(selector = "#titel_div",
               where = "afterEnd",
               ui = tagList(
                 div(class = "scroll_auto",
                                    if (exists(output_function))
                 do.call(
                   output_function, list(input, output, session, id = place_id)
                 )

                 )))
      
      DATA$ui <- paste0("#m_name_placeWidget-", place_id)
      # row_widget <- row_widget_r()
      title <- paste(widget_r(), "with", package_r())
      title <- paste0(toupper(substr(title, 1, 1)), substr(title, 2, 40))
      DATA$title <- title
      
    })
    
    # row_widget_r <- reactive({
    #   widget <- widget_r()
    #   package <- package_r()
    #   row <-
    #     dataWidgets[dataWidgets$widget == widget &
    #                   dataWidgets$package == package, ]
    # })
    output$title <- renderText({
      # row_widget <- row_widget_r()
      # row_widget$title[1]
      DATA$title
    })
    # mydata_r <- reactive({
    #   eval(parse(text = data_r()))
    # })
  }
