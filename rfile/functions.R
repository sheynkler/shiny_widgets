
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

# Automatik generated:


draw_scatter_plotly <- function(input, output, session){
  renderPlotly({
    plot_ly(cars, x = ~dist, y = ~speed)
  })
}
output_scatter_plotly <-  function(input, output, session, id) plotlyOutput(session$ns(id))
draw_lines_plotly <- function(input, output, session){
  renderPlotly({
    plot_ly(cars, x = c(1:nrow(cars)), y = ~speed, mode = 'lines')
  })
}
output_lines_plotly <-  function(input, output, session, id) plotlyOutput(session$ns(id))
draw_bar_plotly <- function(input, output, session){
  renderPlotly({
        plot_ly(
      x = c("giraffes", "orangutans", "monkeys"),
      y = c(20, 14, 23),
      name = "SF Zoo",
      type = "bar"
    )
  })
}
output_bar_plotly <-  function(input, output, session, id) plotlyOutput(session$ns(id))
