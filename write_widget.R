
# KOnstante string

draw_function <- "<- function(input, output, session){
  draw_function
}"

out_function <- "<-  function(input, output, session, id) out_function(session$ns(id))"
library_line <- "library(lib_package);"
# new data


widget <- "bar"
package <- "plotly"
data <- NULL

draw_insert <- 'renderPlotly({
        plot_ly(
      x = c("giraffes", "orangutans", "monkeys"),
      y = c(20, 14, 23),
      name = "SF Zoo",
      type = "bar"
    )
  })'

out_insert <- "plotlyOutput"

# GO!
source("rfile/function_to_write.R")
write_data_to_R(widget, package, data)

