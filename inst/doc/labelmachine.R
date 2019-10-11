## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  comment = "#>"
)
fig_path <- function(file) {
  dir <- knitr::opts_chunk$get("fig.path")
  dir.create(dir, showWarnings = FALSE, recursive = TRUE)
  paste0(dir, file)
}
pkgdown_link <- function(text, file) {
  url <- file.path(
    "https://a-maldet.github.io/labelmachine/articles/labelmachine_files",
    "figure-html", file
  )
  paste0("[", text, "](", url, ")")
}

## ---- eval = FALSE-------------------------------------------------------
#  # Install release version from CRAN
#  install.packages("labelmachine")
#  
#  # Install development version from GitHub
#  devtools::install_github('a-maldet/labelmachine', build_vignettes = TRUE)

## ------------------------------------------------------------------------
df <- data.frame(
  pupil_id = rep(1:4, each = 3),
  subject = rep(c("eng", "mat", "gym"), 4),
  result = c(1, 2, 2, NA, 2, NA, 1, 0, 1, 2, 3, NA),
  stringsAsFactors = FALSE
)
df

## ------------------------------------------------------------------------
library(labelmachine)
dict <- new_lama_dictionary(
  sub = c(eng = "English", mat = "Mathematics", gym = "Gymnastics"),
  res = c(
    "1" = "Good",
    "2" = "Passed",
    "3" = "Not passed",
    "4" = "Not passed",
    NA_ = "Missed",
    "0" = NA
  )
)
dict

## ------------------------------------------------------------------------
df_new <- lama_translate(
    df,
    dict,
    subject_lab = sub(subject),
    result_lab = res(result)
  )
str(df_new)

## ---- eval = FALSE-------------------------------------------------------
#  path_to_file <- file.path(tempdir(), "my_dictionary.yaml")
#  lama_write(dict, path_to_file)

## ---- eval = FALSE-------------------------------------------------------
#  path_to_file <- system.file("extdata", "dictionary_exams.yaml", package = "labelmachine")
#  dict <- lama_read(path_to_file)

