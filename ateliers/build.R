setwd("./ateliers")

rmd <- list.files(pattern = ".Rmd")
lapply(rmd, rmarkdown::render)
