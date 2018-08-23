code_server_sankey_flipPlots <- '  renderSankeyNetwork({
    mydata <-  mydata_r()
    SankeyDiagram(mydata[,-4],
                  link.color = "Source",
                  weights = mydata$freq)
  })'

code_server_table_dataTable <- '  renderDataTable({
    mydata_r()
  })'


code_ui_sankey_flipPlots <- 'sankeyNetworkOutput(session$ns(id))'
code_ui_table_dataTable <- 'dataTableOutput(session$ns(id))'