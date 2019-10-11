## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(labelmachine)
dict <- new_lama_dictionary(
  sub = c(eng = "English", mat = "Mathematics", gym = "Gymnastics"),
  lev = c(b = "Basic", a = "Advanced"),
  result = c(
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
dict_new <- lama_rename(
  dict,
  subject_new = sub,
  level_new = lev,
  result_new = result
)
dict_new

## ------------------------------------------------------------------------
dict_new <- lama_rename_(
  dict,
  old = c("sub", "lev", "result"),
  new = c("subject_new", "level_new", "result_new")
)
dict_new

## ------------------------------------------------------------------------
dict_new <- lama_select(dict, sub, lev)
dict_new

## ------------------------------------------------------------------------
dict_new <- lama_select_(dict, c("sub", "lev"))
dict_new

## ------------------------------------------------------------------------
dict_new <- lama_mutate(
  .data = dict,
  teacher = c(jane = "Jane Doe", john = "John Doe"),
  sub = c(geo = "Geography", sub),
  lev = NULL,
  result = c(P = "Passed", F = "Failed")
)
dict_new

## ------------------------------------------------------------------------
dict_new <- lama_mutate_(
  .data = dict,
  key = "result",
  translation = c(P = "Passed", F = "Failed")
)
dict_new

## ------------------------------------------------------------------------
dict_a <- new_lama_dictionary(a = c(a = "A"), x = c(x = "A"), y = c(y = "A"))
dict_b <- new_lama_dictionary(b = c(b = "B"), x = c(x = "B"), z = c(z = "B"))
dict_c <- new_lama_dictionary(c = c(c = "C"), z = c(x = "B"))

## ------------------------------------------------------------------------
dict_new <- lama_merge(dict_a, dict_b, dict_c, show_warnings = FALSE)
dict_new

