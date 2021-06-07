file.copy("insert-logo.html", "ateliers/insert-logo.html")
file.copy(here::here('resources'), here::here('ateliers'), recursive = TRUE)


setwd("./ateliers")

# DOREMIFASOL -------------------

# Télécharger les données grâce à doremifasol
options(doremifasol.telDir = "~")
doremifasol::telechargerFichier("BPE_ENS")
doremifasol::telechargerFichier("DECES_COM_0918")

fichiers_zip <- list.files(pattern = "\\.zip$", full.names = TRUE)

# Décompresser les fichiers .zip
invisible(
  lapply(
    fichiers_zip,
    utils::unzip,
    overwrite = TRUE
  )
)

# Supprimer les fichiers .zip
unlink(fichiers_zip)

# COMPILER RMD -------------------


# Compiler les Rmd
rmd <- list.files(pattern = ".Rmd")
rmd <- rmd[rmd != "import_fichiers.Rmd"]
lapply(rmd, rmarkdown::render)

lapply(rmd[rmd != "index.Rmd"], knitr::purl)
