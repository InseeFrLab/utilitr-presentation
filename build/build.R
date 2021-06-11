

lapply(c("public","ateliers"), function(i){
  file.copy(here::here('resources'), here::here(i), recursive = TRUE)
  file.copy(here::here('css'), here::here(i), recursive = TRUE)
})


lapply(list.files(pattern = "*.Rmd", recursive = FALSE), function(flname){
  rmarkdown::render(flname)
  file.copy(gsub(".Rmd", ".html", flname), paste0("public/", flname))
  file.remove(gsub(".Rmd", ".html", flname))
})
