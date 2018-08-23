
draw_sankey_flipPlots <- function(input, output, session){
  renderSankeyNetwork({
    mydata <-  data.frame(Married = c("Yes","Yes", "Yes", "No", "No"),
                          Pet = c("Yes", "Yes", "No", "Yes", "No"),
                          Happy = c("Yes", "Yes", "Yes", "Yes", "No"),
                          freq = 5:1)
    SankeyDiagram(mydata[,-4],
                  link.color = "Source",
                  weights = mydata$freq)
  })
}

draw_table_dataTable <- function(input, output, session){
  renderDataTable({
    mtcars
  })
}

output_sankey_flipPlots <-  function(input, output, session, id) sankeyNetworkOutput(session$ns(id))
output_table_dataTable <-   function(input, output, session, id) dataTableOutput(session$ns(id))




