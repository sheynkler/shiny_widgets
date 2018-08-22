draw_sankey_flipPlots <- function(input, output, session, mydata_r){
  renderSankeyNetwork({
    mydata <-  mydata_r()
    SankeyDiagram(mydata[,-4],
                  link.color = "Source",
                  weights = mydata$freq)
  })
}

draw_table_dataTable <- function(input, output, session, mydata_r, widget_r){
  renderDataTable({
    mydata_r()
  })
}
output_sankey_flipPlots <-  function(input, output, session, id) sankeyNetworkOutput(session$ns(id))
output_table_dataTable <-   function(input, output, session, id) dataTableOutput(session$ns(id))

code_server_sankey_flipPlots <- '  renderSankeyNetwork({
    mydata <-  mydata_r()
    SankeyDiagram(mydata[,-4],
                  link.color = "Source",
                  weights = mydata$freq)
  })'


# drawfunction <- function(input, output, session, mydata_r, widget_r){
#   
#   
#   return(renderSankeyNetwork({
#     
#     
#     #mydata <- data_to_sankey_flipPlots  # mydata_r()
#     mydata <-  mydata_r()
#     
#     
#     SankeyDiagram(mydata[,-4],
#                   link.color = "Source",
#                   weights = mydata$freq)
#   }))
#   
#   }



