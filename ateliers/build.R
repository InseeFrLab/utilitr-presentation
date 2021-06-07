setwd("./ateliers")

rmd <- list.files(pattern = ".Rmd")
lapply(rmd, rmarkdown::render)


out_html <- list.files(pattern = ".html")
lapply(out_html, function(i) file.copy(i, to = paste0("../atelier_out/", i)))
