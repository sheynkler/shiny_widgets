
widget <- "scatter"
package <- "plotly"
title <- "Scatterplot with plotly"
data <- "mtcars"
library <- package
draw_f <- "renderPlotly({
    plot_ly(mtcars, x = ~mpg, y = ~wt)
})"
out_f <- ""
code_s <- ""
code_ui <- ""
data <- NULL


