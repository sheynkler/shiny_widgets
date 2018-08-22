source("rfile/data.R")
source("rfile/functions.R")

source("module/module_placeWidget.R")
library(networkD3)
library(flipPlots)
library(shinyAce)

#library(DT)
dataWidgets <- read.csv("data/dataWidgets.csv", sep = ";", dec = ",", header = T, stringsAsFactors = 
                          F)


widgetChoises <- dataWidgets$widget

widgetPackages <- dataWidgets$package


widgetDatas <- c("data_to_sankey_flipPlots", "cars")

DRAWFUNCTION <- "draw_sankey_flipPlots"
#index = 1
