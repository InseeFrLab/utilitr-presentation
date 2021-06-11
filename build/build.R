# dir.create("public")
dir.create("public/archives")
dir.create("public/ateliers")

lapply(c("public","ateliers","archives", "public/archives", "public/ateliers"), function(i){
  file.copy(here::here('resources'), here::here(i), recursive = TRUE)
  file.copy(here::here('css'), here::here(i), recursive = TRUE)
  file.copy(here::here('insert-logo.html'), here::here(i), recursive = TRUE)
})


lapply(list.files(pattern = "*.Rmd", recursive = FALSE), function(flname){
  rmarkdown::render(flname)
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(flname_html, paste0("public/", flname_html))
  file.remove(flname_html)
})

setwd(here::here("archives"))

lapply(list.files(pattern = "*.Rmd", recursive = FALSE), function(flname){
  rmarkdown::render(flname)
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(gsub(".Rmd", ".html", flname),
            paste0(here::here("public","archives", flname_html))
            )
  file.remove(flname_html)
})


setwd(here::here())

source('ateliers/build.R')

setwd(here::here())

files <- list.files(pattern = "*.Rmd", full.names = FALSE, path = "ateliers")
lapply(files, function(flname){
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(paste0("./ateliers/", flname_html), paste0("public/ateliers/", flname_html))
  file.remove(paste0("./ateliers/", flname_html))
})
