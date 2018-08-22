source("rfile/data.R")
source("rfile/functions.R")

source("module/module_placeWidget.R")
library(networkD3)
library(flipPlots)
#library(DT)
dataWidgets <- read.csv("data/dataWidgets.csv", sep = ";", dec = ",", header = T, stringsAsFactors = 
                          F)


widgetChoises <- c("sankey", "table")

widgetPackages <- c("flipPlots", "dataTable")


widgetDatas <- c("data_to_sankey_flipPlots", "cars")

DRAWFUNCTION <- "draw_sankey_flipPlots"
#index = 1
