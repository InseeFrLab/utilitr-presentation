# dir.create("public")

setwd(here::here())

# CREATION INDENTATION -----------------------

dir.create("public/archives")
dir.create("public/matinees2021")
dir.create("public/ateliers")
dir.create("public/archives/matinees2021")

lapply(c("public",
         "archives", "public/archives",
         "ateliers", "public/ateliers",
         "archives/matinees2021", "public/archives/matinees2021"), function(i){
  file.copy(here::here('resources'), here::here(i), recursive = TRUE)
  file.copy(here::here('css'), here::here(i), recursive = TRUE)
  file.copy(here::here('insert-logo.html'), here::here(i), recursive = TRUE)
})


# LATEST A LA RACINE ------------------


lapply(list.files(pattern = "*.Rmd", recursive = FALSE), function(flname){
  rmarkdown::render(flname)
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(flname_html, paste0("public/", flname_html))
  file.remove(flname_html)
})

# ARCHIVES ------------------


setwd(here::here("archives"))

## ROOT =====

lapply(list.files(pattern = "*.Rmd", recursive = FALSE), function(flname){
  rmarkdown::render(flname)
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(gsub(".Rmd", ".html", flname),
            paste0(here::here("public","archives", flname_html))
            )
  file.remove(flname_html)
})

## MATINEES =====

setwd(here::here("archives", "matinees2021"))


lapply(list.files(pattern = "*.Rmd", recursive = FALSE), function(flname){
  rmarkdown::render(flname)
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(gsub(".Rmd", ".html", flname),
            paste0(here::here("public","archives", flname_html))
  )
  file.remove(flname_html)
})


# ATELIERS ------------------

setwd(here::here())

source('ateliers/build.R')

setwd(here::here())

files <- list.files(pattern = "*.Rmd", full.names = FALSE, path = "ateliers")
lapply(files, function(flname){
  flname_html <- gsub(".Rmd", ".html", flname)
  file.copy(paste0("./ateliers/", flname_html), paste0("public/ateliers/", flname_html))
  file.remove(paste0("./ateliers/", flname_html))
})
