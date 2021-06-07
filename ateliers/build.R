setwd("./ateliers")

rmd <- list.files(pattern = ".Rmd")
rmarkdown::render(rmd)
