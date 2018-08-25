rm(list = ls())
source("rfile/data.R")
source("rfile/functions.R")
source("module/module_placeWidget.R")
source("rfile/librarys.R")
source("rfile/code_show.R")


dataWidgets <- read.csv("data/dataWidgets.csv", sep = ";", dec = ",", header = T, stringsAsFactors = 
                          F)


widgetChoises <- dataWidgets$widget

widgetPackages <- dataWidgets$package


# widgetDatas <- dataWidgets$data

# DRAWFUNCTION <- "draw_sankey_flipPlots"
#index = 1
