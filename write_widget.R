source("rfile/function_to_write.R")

widget <- "Gauge"
package <- "plotly"


draw_insert <- 'renderPlotly({
density <- density(diamonds$carat)
p <- plot_ly(
      type = "sankey",
node = list(
label = c("A1", "A2", "B1", "B2", "C1", "C2")
),
link = list(
source = c(0,1,0,2,3,3),
target = c(2,3,3,4,4,5),
value =  c(8,4,2,8,4,2)
)
)
  })'

out_insert <- "plotlyOutput"

# GO!

write_data_to_R(widget, package, data)

