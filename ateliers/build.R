file.copy("insert-logo.html", "ateliers/insert-logo.html")
file.copy(here::here('resources'), here::here('ateliers'), recursive = TRUE)


setwd("./ateliers")

rmd <- list.files(pattern = ".Rmd")
lapply(rmd, rmarkdown::render)

lapply(rmd[rmd != "index.Rmd"], knitr::purl)
