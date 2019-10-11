## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
df <- data.frame(
  pupil_id = rep(1:4, each = 3),
  subject = rep(c("eng", "mat", "gym"), 4),
  level = factor(
    c("a", "a", "a", "b", "b", "b", "b", "b", "b", "a", "a", "a"),
    levels = c("a", "b")
  ),
  result = c(1, 2, 2, NA, 2, NA, 1, 0, 1, 2, 3, NA),
  stringsAsFactors = FALSE
)
df

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
df_new <- lama_translate(
  .data = df,
  dictionary = dict,
  subject_new = sub(subject),
  level = lev(level),
  result = result(result),
  keep_order = c(FALSE, TRUE, FALSE),
  to_factor = c(TRUE, TRUE, FALSE)
)
str(df_new)

## ------------------------------------------------------------------------
df_new <- lama_translate_(
  .data = df,
  dictionary = dict,
  translation = c("sub", "lev", "result"),
  col = c("subject", "level", "result"),
  col_new = c("subject_new", "level", "result"),
  keep_order = c(FALSE, TRUE, FALSE),
  to_factor = c(TRUE, TRUE, FALSE)
)
str(df_new)

## ------------------------------------------------------------------------
df_new <- lama_translate_all(
  .data = df,
  dictionary = dict,
  prefix = "new_",
  fn_colname = toupper,
  suffix = "_labeled",
  keep_order = TRUE
)
str(df_new)

## ------------------------------------------------------------------------
vec <- c("eng", "eng", "gym", "mat")
vec_labeled <- lama_translate(vec, dict, sub)

## ------------------------------------------------------------------------
vec_labeled <- lama_translate_(vec, dict, "sub")

## ------------------------------------------------------------------------
dict_new <- lama_rename(dict, subject = sub, level = lev)
df_non_factor <- lama_translate_all(df, dict_new, to_factor = FALSE)
str(df_non_factor)

## ------------------------------------------------------------------------
df_factor <- lama_to_factor(
  .data = df_non_factor,
  dictionary = dict,
  subject_new = sub(subject),
  level = lev(level),
  result = result(result)
)
str(df_factor)

## ------------------------------------------------------------------------
df_factor <- lama_to_factor_(
  .data = df_non_factor,
  dictionary = dict,
  translation = c("sub", "lev", "result"),
  col = c("subject", "level", "result")
)
str(df_factor)

## ------------------------------------------------------------------------
df_factor <- lama_to_factor_all(
  .data = df_non_factor,
  dictionary = dict
)
str(df_factor)

