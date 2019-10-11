## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  comment = "#>"
)
knitr::opts_hooks$set(out.maxwidth = function(options) {
  if (!knitr:::is_html_output())
    return(options)
  options$out.extra <- sprintf(
    'style="max-width: %s; width: %s;"',
    options$out.maxwidth,
    options$out.width
  )
  options
})

## ------------------------------------------------------------------------
subject_translation <- c(eng = "English", mat = "Mathematics", gym = "Gymnastics")

## ------------------------------------------------------------------------
library(labelmachine)
dict <- new_lama_dictionary(
  sub = subject_translation,
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

## ---- out.maxwidth = "450px", out.width = "100%"-------------------------
knitr::include_graphics("createdictionary.png")

## ------------------------------------------------------------------------
obj <- list(
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
dict <- new_lama_dictionary(obj)
dict

## ---- eval = FALSE-------------------------------------------------------
#  path_to_file <- system.file("extdata", "dictionary_exams.yaml", package = "labelmachine")
#  dict <- lama_read(path_to_file)

## ---- eval = FALSE-------------------------------------------------------
#  path_to_file <- file.path(tempdir(), "my_dictionary.yaml")
#  lama_write(dict, path_to_file)

## ---- include = FALSE----------------------------------------------------
df_trans <- data.frame(
  sub_old = c("eng", "mat", "gym", NA, NA, NA),
  sub_new = c("English", "Mathematics", "Gymnastics", NA, NA, NA),
  res_old = c(0, 1, 2, 3, 4, NA),
  res_new = c(NA, "Good", "Passed", "Not passed", "Not passed", "Missed")
)

## ------------------------------------------------------------------------
df_trans

## ------------------------------------------------------------------------
dict <- as.lama_dictionary(
  .data = df_trans,
  translation = c("sub", "res"),
  col_old = c("sub_old", "res_old"),
  col_new = c("sub_new", "res_new")
)
dict

