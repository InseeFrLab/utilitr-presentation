file.copy("insert-logo.html", "ateliers/insert-logo.html")

setwd("./ateliers")

rmd <- list.files(pattern = ".Rmd")
lapply(rmd, rmarkdown::render)

lapply(rmd[rmd != "index.Rmd"], knitr::purl)
