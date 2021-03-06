% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lama_translate.R
\name{lama_translate}
\alias{lama_translate}
\alias{lama_translate.data.frame}
\alias{lama_translate.default}
\alias{lama_translate_}
\alias{lama_translate_.data.frame}
\alias{lama_translate_.default}
\alias{lama_to_factor}
\alias{lama_to_factor.data.frame}
\alias{lama_to_factor.default}
\alias{lama_to_factor_}
\alias{lama_to_factor_.data.frame}
\alias{lama_to_factor_.default}
\title{Assign new labels to a variable of a data.frame}
\usage{
lama_translate(.data, dictionary, ..., keep_order = FALSE,
  to_factor = TRUE)

\method{lama_translate}{data.frame}(.data, dictionary, ...,
  keep_order = FALSE, to_factor = TRUE)

\method{lama_translate}{default}(.data, dictionary, ...,
  keep_order = FALSE, to_factor = TRUE)

lama_translate_(.data, dictionary, translation, col = translation,
  col_new = col, keep_order = FALSE, to_factor = TRUE, ...)

\method{lama_translate_}{data.frame}(.data, dictionary, translation,
  col = translation, col_new = col, keep_order = FALSE,
  to_factor = TRUE, ...)

\method{lama_translate_}{default}(.data, dictionary, translation, ...,
  keep_order = FALSE, to_factor = TRUE)

lama_to_factor(.data, dictionary, ..., keep_order = FALSE)

\method{lama_to_factor}{data.frame}(.data, dictionary, ...,
  keep_order = FALSE)

\method{lama_to_factor}{default}(.data, dictionary, ...,
  keep_order = FALSE)

lama_to_factor_(.data, dictionary, translation, col = translation,
  col_new = col, keep_order = FALSE, ...)

\method{lama_to_factor_}{data.frame}(.data, dictionary, translation,
  col = translation, col_new = col, keep_order = FALSE, ...)

\method{lama_to_factor_}{default}(.data, dictionary, translation, ...,
  keep_order = FALSE)
}
\arguments{
\item{.data}{Either a data frame, a factor or an atomic vector.}

\item{dictionary}{A \link[=new_lama_dictionary]{lama_dictionary} object, holding the translations for various
variables.}

\item{...}{Only used by \code{\link[=lama_translate]{lama_translate()}} and \code{\link[=lama_to_factor]{lama_to_factor()}}.
Each argument in \code{...} is an unquoted expression and defines a translation.
Use unquoted
arguments that tell which translation should be applied to which column and
which column name the relabeled variable should be assigned to. E.g.
\code{lama_translate(.data, dict, Y1 = TRANS1(X1), Y2 = TRANS2(Y2))} and
\code{lama_to_factor(.data, dict, Y1 = TRANS1(X1), Y2 = TRANS2(Y2))} and
to apply the translations \code{TRANS1} and \code{TRANS2} to the data.frame
columns \code{X1} and \code{X2} and save the new labeled variables under
the column names \code{Y1} and \code{Y2}.
There are also two abbreviation mechanisms available:
The argument assignment \code{FOO(X)} is the same as \code{X = FOO(X)} and
\code{FOO} is an abbreviation for \code{FOO = FOO(FOO)}.
In case, \code{.data} is not a data frame but a plain factor or an atomic vector, then
the argument \code{...} must be a single unquoted translation name
(e.g. \code{lama_translate(x, dict, TRANS1)}, where \code{x} is a factor or an atomic vector
and \code{TRANS1} is the name of the translation, which should be used to assign
the labels to the values of \code{x}.)}

\item{keep_order}{A boolean vector of length one or the same length as the
number of translations. If the vector has length one, then the same
configuration is applied to all variable translations. If the vector has
the same length as the number of arguments in \code{...}, then the
to each variable translation there is a corresponding boolean configuration.
If a translated variable in the data.frame is a factor variable,
and the corresponding boolean configuration is set to \code{TRUE}, then the
the order of the original factor variable will be preserved.}

\item{to_factor}{A boolean vector of length one or the same length as the
number of translations. If the vector has length one, then the same
configuration is applied to all variable translations. If the vector has
the same length as the number of arguments in \code{...}, then the
to each variable translation there is a corresponding boolean configuration.
If \code{to_factor} is \code{TRUE}, then the resulting labeled
variable will be a factor. If \code{to_factor} is set to \code{FALSE}, then
the resulting labeled variable will be a plain character vector.}

\item{translation}{A character vector holding the names of the variable
translations which
should be used for assigning new labels to the variable. This names must be
a subset of the translation names returned by \code{names(dictionary)}.}

\item{col}{Only used if \code{.data} is a data frame. The argument \code{col} must be
a character vector of the same length as \code{translation} holding
the names of the data.frame columns that
should be relabeled. If omitted, then it will be assumed that the column
names are the same as the given translation names in the argument \code{translation}.}

\item{col_new}{Only used if \code{.data} is a data frame. The argument \code{col} must be
a character vector of the same length as \code{translation} holding
the names under which the relabeled variables should be stored in
the data.frame. If omitted, then it will be assumed that the new column
names are the same as the column names of the original variables.}
}
\value{
An extended data.frame, that has a factor variable holding the
assigned labels.
}
\description{
The functions \code{\link[=lama_translate]{lama_translate()}} and \code{\link[=lama_translate_]{lama_translate_()}} take a factor,
a vector or a data.frame
and convert one or more of its categorical variables
(not necessarily a factor variable) into factor variables with new labels.
The function \code{\link[=lama_translate]{lama_translate()}} uses non-standard evaluation, whereas
\code{\link[=lama_translate_]{lama_translate_()}} is the standard evaluation alternative.
The functions \code{\link[=lama_to_factor]{lama_to_factor()}} and \code{\link[=lama_to_factor_]{lama_to_factor_()}} are very similar
to the functions \code{\link[=lama_translate]{lama_translate()}} and \code{\link[=lama_translate_]{lama_translate_()}}, but instead
of assigning new label strings to values, it is assumed that the variables
are character vectors or factors, but need to be turned into factors
with the order given in the translations:
\itemize{
\item \code{\link[=lama_translate]{lama_translate()}} and \code{\link[=lama_translate_]{lama_translate_()}}: Assign new labels to a variable
and turn it into a factor variable with the order given in the corresponding
translation (\code{keep_order = FALSE}) or in the same order as the original
variable (\code{keep_order = TRUE}).
\item \code{\link[=lama_to_factor]{lama_to_factor()}} and \code{\link[=lama_to_factor_]{lama_to_factor_()}}: The variable is a character
vector or a factor already holding the right label strings. The variables
are turned into a factor variable with the order given in the corresponding
translation (\code{keep_order = FALSE}) or in the same order as the original
variable (\code{keep_order = TRUE}).
}
}
\details{
The functions \code{\link[=lama_translate]{lama_translate()}}, \code{\link[=lama_translate_]{lama_translate_()}}, \code{\link[=lama_to_factor]{lama_to_factor()}}
and \code{\link[=lama_to_factor_]{lama_to_factor_()}} require different
arguments, depending on the data type passed into argument \code{.data}.
If \code{.data} is of type character, logical, numeric or factor, then
the arguments \code{col} and \code{col_new} are omitted, since those are only
necessary in the case of data frames.
}
\examples{
  # initialize lama_dictinoary
  dict <- new_lama_dictionary(
    subject = c(en = "English", ma = "Mathematics"),
    result = c("1" = "Very good", "2" = "Good", "3" = "Not so good")
  )
  # the data frame which should be translated
  df <- data.frame(
    pupil = c(1, 1, 2, 2, 3),
    subject = c("en", "ma", "ma", "en", "en"),
    res = c(1, 2, 3, 2, 2)
  )

  ## Example-1: Usage of 'lama_translate' for data frames
  ##            Full length assignment
  # (apply translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply translation 'result' to column 'res' and save it to column 'res_new')
  df_new <- lama_translate(
    df,
    dict,
    sub_new = subject(subject),
    res_new = result(res)
  )
  str(df_new)

  ## Example-2: Usage of 'lama_translate' for data frames
  ##            Abbreviation overwriting original columns
  # (apply translation 'subject' to column 'subject' and save it to column 'subject')
  # (apply translation 'result' to column 'res' and save it to column 'res')
  df_new_overwritten <- lama_translate(
    df,
    dict,
    subject(subject),
    result(res)
  )
  str(df_new_overwritten)

  ## Example-3: Usage of 'lama_translate' for data frames
  ##            Abbreviation if `translation_name == column_name`
  # (apply translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply translation 'result' to column 'res' and save it to column 'res_new')
  df_new_overwritten <- lama_translate(
    df, 
    dict,
    subject_new = subject,
    res_new = result(res)
  )
  str(df_new_overwritten)
  
  ## Example-4: Usage of 'lama_translate' for data frames labeling as character vectors
  # (apply translation 'subject' to column 'subject' and
  # save it as a character vector to column 'subject_new')
  df_new_overwritten <- lama_translate(
    df, 
    dict,
    subject_new = subject,
    to_factor = TRUE
  )
  str(df_new_overwritten)
  
  ## Example-5: Usage of 'lama_translate' for atomic vectors
  sub <- c("ma", "en", "ma")
  sub_new <- df_new_overwritten <- lama_translate(
    sub,
    dict,
    subject
  )
  str(sub_new)

  ## Example-6: Usage of 'lama_translate' for factors
  sub <- factor(c("ma", "en", "ma"), levels = c("ma", "en"))
  sub_new <- df_new_overwritten <- lama_translate(
    sub,
    dict,
    subject,
    keep_order = TRUE
  )
  str(sub_new)
  
  ## Example-7: Usage of 'lama_translate_' for data frames
  # (apply translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply translation 'result' to column 'res' and save it to column 'res_new')
  df_new <- lama_translate_(
    df, 
    dict,
    translation = c("subject", "result"),
    col = c("subject", "res"),
    col_new = c("subject_new", "res_new")
  )
  str(df_new)
  
  ## Example-8: Usage of 'lama_translate_' for data frames and store as character vector
  # (apply translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply translation 'result' to column 'res' and save it to column 'res_new')
  df_new <- lama_translate_(
    df, 
    dict,
    translation = c("subject", "result"),
    col = c("subject", "res"),
    col_new = c("subject_new", "res_new"),
    to_factor = c(FALSE, FALSE)
  )
  str(df_new)
  
  ## Example-9: Usage of 'lama_translate_' for atomic vectors
  res <- c(1, 2, 1, 3, 1, 2)
  res_new <- df_new_overwritten <- lama_translate_(
    res,
    dict,
    "result"
  )
  str(res_new)

  ## Example-10: Usage of 'lama_translate_' for factors
  sub <- factor(c("ma", "en", "ma"), levels = c("ma", "en"))
  sub_new <- df_new_overwritten <- lama_translate_(
    sub,
    dict,
    "subject",
    keep_order = TRUE
  )
  str(sub_new)
  # the data frame which holds the right labels, but no factors
  df_translated <- data.frame(
    pupil = c(1, 1, 2, 2, 3),
    subject = c("English", "Mathematics", "Mathematics", "English", "English"),
    res = c("Very good", "Good", "Not so good", "Good", "Good")
  )
 
  ## Example-11: Usage of 'lama_to_factor' for data frames
  ##            Full length assignment
  # (apply order of translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply order of translation 'result' to column 'res' and save it to column 'res_new')
  df_new <- lama_to_factor(
    df_translated,
    dict,
    sub_new = subject(subject),
    res_new = result(res)
  )
  str(df_new)

  ## Example-12: Usage of 'lama_to_factor' for data frames
  ##            Abbreviation overwriting original columns
  # (apply order of translation 'subject' to column 'subject' and save it to column 'subject')
  # (apply order of translation 'result' to column 'res' and save it to column 'res')
  df_new_overwritten <- lama_to_factor(
    df_translated,
    dict,
    subject(subject),
    result(res)
  )
  str(df_new_overwritten)

  ## Example-13: Usage of 'lama_to_factor' for data frames
  ##            Abbreviation if `translation_name == column_name`
  # (apply order of translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply order of translation 'result' to column 'res' and save it to column 'res_new')
  df_new_overwritten <- lama_to_factor(
    df_translated, 
    dict,
    subject_new = subject,
    res_new = result(res)
  )
  str(df_new_overwritten)
  
  ## Example-14: Usage of 'lama_translate' for atomic vectors
  var <- c("Mathematics", "English", "Mathematics")
  var_new <- lama_to_factor(
    var,
    dict,
    subject
  )
  str(var_new)
  
  ## Example-15: Usage of 'lama_to_factor_' for data frames
  # (apply order of translation 'subject' to column 'subject' and save it to column 'subject_new')
  # (apply order of translation 'result' to column 'res' and save it to column 'res_new')
  df_new <- lama_to_factor_(
    df_translated, 
    dict,
    translation = c("subject", "result"),
    col = c("subject", "res"),
    col_new = c("subject_new", "res_new")
  )
  str(df_new)
  
  ## Example-16: Usage of 'lama_to_factor_' for atomic vectors
  var <- c("Very good", "Good", "Good")
  var_new <- lama_to_factor_(
    var,
    dict,
    "result"
  )
  str(var_new)
}
\seealso{
\code{\link[=lama_translate_all]{lama_translate_all()}}, \code{\link[=lama_to_factor_all]{lama_to_factor_all()}}, \code{\link[=new_lama_dictionary]{new_lama_dictionary()}},
\code{\link[=as.lama_dictionary]{as.lama_dictionary()}}, \code{\link[=lama_rename]{lama_rename()}}, \code{\link[=lama_select]{lama_select()}}, \code{\link[=lama_mutate]{lama_mutate()}},
\code{\link[=lama_merge]{lama_merge()}}, \code{\link[=lama_read]{lama_read()}}, \code{\link[=lama_write]{lama_write()}}
}
