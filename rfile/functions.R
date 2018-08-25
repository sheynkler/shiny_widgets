

draw_sankey_flipPlots <- function(input, output, session) {
  renderSankeyNetwork({
    mydata <-  data.frame(
      Married = c("Yes", "Yes", "Yes", "No", "No"),
      Pet = c("Yes", "Yes", "No", "Yes", "No"),
      Happy = c("Yes", "Yes", "Yes", "Yes", "No"),
      freq = 5:1
    )
    SankeyDiagram(mydata[, -4],
                  link.color = "Source",
                  weights = mydata$freq)
  })
}

draw_table_dataTable <- function(input, output, session) {
  renderDataTable({
    mtcars
  })
}

output_sankey_flipPlots <-
  function(input, output, session, id)
    sankeyNetworkOutput(session$ns(id))
output_table_dataTable <-
  function(input, output, session, id)
    dataTableOutput(session$ns(id))

# Automatik generated:


draw_scatter_plotly <- function(input, output, session) {
  renderPlotly({
    plot_ly(cars, x = ~ dist, y = ~ speed)
  })
}
output_scatter_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_lines_plotly <- function(input, output, session) {
  renderPlotly({
    plot_ly(cars,
            x = c(1:nrow(cars)),
            y = ~ speed,
            mode = 'lines')
  })
}
output_lines_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_bar_plotly <- function(input, output, session) {
  renderPlotly({
    plot_ly(
      x = c("giraffes", "orangutans", "monkeys"),
      y = c(20, 14, 23),
      name = "SF Zoo",
      type = "bar"
    )
  })
}
output_bar_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_GroupedBar_plotly <- function(input, output, session) {
  renderPlotly({
    Animals <- c("giraffes", "orangutans", "monkeys")
    SF_Zoo <- c(20, 14, 23)
    LA_Zoo <- c(12, 18, 29)
    data <- data.frame(Animals, SF_Zoo, LA_Zoo)
    plot_ly(
      data,
      x = ~ Animals,
      y = ~ SF_Zoo,
      type = "bar",
      name = "SF Zoo"
    ) %>%
      add_trace(y = ~ LA_Zoo, name = "LA Zoo") %>%
      layout(yaxis = list(title = "Count"), barmode = "group")
  })
}
output_GroupedBar_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_StackedBar_plotly <- function(input, output, session) {
  renderPlotly({
    Animals <- c("giraffes", "orangutans", "monkeys")
    SF_Zoo <- c(20, 14, 23)
    LA_Zoo <- c(12, 18, 29)
    data <- data.frame(Animals, SF_Zoo, LA_Zoo)
    plot_ly(
      data,
      x = ~ Animals,
      y = ~ SF_Zoo,
      type = "bar",
      name = "SF Zoo"
    ) %>%
      add_trace(y = ~ LA_Zoo, name = "LA Zoo") %>%
      layout(yaxis = list(title = "Count"), barmode = "stack")
  })
}
output_StackedBar_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_Pie_plotly <- function(input, output, session) {
  renderPlotly({
    Animals <- c("giraffes", "orangutans", "monkeys")
    SF_Zoo <- c(20, 14, 23)
    data <- data.frame(Animals, SF_Zoo)
    plot_ly(
      data,
      labels = ~ Animals,
      values = ~ SF_Zoo,
      type = "pie"
    )
  })
}
output_Pie_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_Bubble_plotly <- function(input, output, session) {
  renderPlotly({
    data <- LifeCycleSavings
    data$text <- row.names(LifeCycleSavings)
    plot_ly(
      data,
      x = ~ sr,
      y = ~ pop15,
      text = ~ text,
      type = "scatter",
      mode = "markers",
      marker = list(size = ~ dpi / 100, opacity = 0.5)
    )
  })
}
output_Bubble_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_Area_plotly <- function(input, output, session) {
  renderPlotly({
    density <- density(diamonds$carat)
    p <-
      plot_ly(
        x = ~ density$x,
        y = ~ density$y,
        type = "scatter",
        mode = "lines",
        fill = "tozeroy"
      ) %>%
      layout(xaxis = list(title = "Carat"),
             yaxis = list(title = "Density"))
  })
}
output_Area_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
draw_sankey_plotly <- function(input, output, session) {
  renderPlotly({
    p <- plot_ly(
      type = "sankey",
      node = list(label = c("A1", "A2", "B1", "B2", "C1", "C2")),
      link = list(
        source = c(0, 1, 0, 2, 3, 3),
        target = c(2, 3, 3, 4, 4, 5),
        value =  c(8, 4, 2, 8, 4, 2)
      )
    )
  })
}
output_sankey_plotly <-
  function(input, output, session, id)
    plotlyOutput(session$ns(id))
