# function

write_data_to_R <- function(widget, package, data){
  lineLibrary <- gsub("lib_package", package, library_line)
  write(lineLibrary, file="rfile/librarys.R", append=TRUE)
  
  line_csv <- paste(widget, package, data, sep = ";")
  write(line_csv, file="data/dataWidgets.csv", append=TRUE)
  write(paste(Sys.time(), line_csv), file="data/log.txt", append=TRUE)
  
  f_draw <- paste("draw", widget, package, sep = "_")
  lines_draw <- gsub("draw_function", draw_insert, draw_function)
  lines_draw_full <- paste(f_draw, lines_draw)
  write(lines_draw_full, file="rfile/functions.R", append=TRUE)
  write(lines_draw_full, file="data/log.txt", append=TRUE)
  
  f_out <- paste("output", widget, package, sep = "_")
  lines_out <- gsub("out_function", out_insert, out_function)
  lines_out_full <- paste(f_out, lines_out)
  write(lines_out_full, file="rfile/functions.R", append=TRUE)
  write(lines_out_full, file="data/log.txt", append=TRUE)
}



