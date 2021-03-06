% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lappli.R
\name{lapplI}
\alias{lapplI}
\alias{sapplI}
\title{Improve \code{lapply} and \code{sapply} with index}
\usage{
lapplI(X, FUN, ...)

sapplI(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)
}
\arguments{
\item{X}{a vector (atomic or list) or an \code{\link{expression}}
    object.  Other objects (including classed objects) will be coerced
    by \code{base::\link{as.list}}.}

\item{FUN}{Here comes the great difference to \code{\link[base:lapply]{base::lapply()}} and
\code{\link[base:sapply]{base::sapply()}}. When using \code{lapplI} and \code{sapplI}, the function
passed into \code{FUN} may also have an extra argument \code{.I}. If it does, then
for each item of \code{X} the current item index
is passed into argument \code{.I} of \code{FUN}.
Besides this extra feature, there is no difference to \code{\link[base:lapply]{base::lapply()}} and
\code{\link[base:sapply]{base::sapply()}}.}

\item{...}{optional arguments to \code{FUN}.}

\item{simplify}{logical or character string; should the result be
    simplified to a vector, matrix or higher dimensional array if
    possible?  For \code{sapply} it must be named and not abbreviated.
    The default value, \code{TRUE}, returns a vector or matrix if appropriate,
    whereas if \code{simplify = "array"} the result may be an
    \code{\link{array}} of \dQuote{rank}
    (\eqn{=}\code{length(dim(.))}) one higher than the result
    of \code{FUN(X[[i]])}.}

\item{USE.NAMES}{logical; if \code{TRUE} and if \code{X} is character,
    use \code{X} as \code{\link{names}} for the result unless it had names
    already.  Since this argument follows \code{\dots} its name cannot
    be abbreviated.}
}
\description{
Improve \code{\link[base:lapply]{base::lapply()}} and \code{\link[base:sapply]{base::sapply()}} functions by allowing
an extra index argument \code{.I} to be passed into the function given in \code{FUN}.
If the function given in \code{FUN} has an argument \code{.I} then, for each entry
of \code{X} passed into \code{FUN} the corresponding index is passed into
argument \code{.I}. If the function given in \code{FUN} has no argument \code{.I},
then \code{lapplI} and  \code{sapplI} are exactly the same as
\code{\link[base:lapply]{base::lapply()}} and \code{\link[base:sapply]{base::sapply()}}.
Besides this extra feature, there is no difference to \code{\link[base:lapply]{base::lapply()}} and
\code{\link[base:sapply]{base::sapply()}}.
}
