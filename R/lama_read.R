#' Read in a \code{yaml} file holding translations for one or multiple variables
#'
#' @param yaml_path Path to yaml file holding the labels and translations for multiple variables
#' @return A [lama_dictionary][new_lama_dictionary()] class object holding the variable translations defined in
#' the yaml file
#' @export
#' @examples
#'   \donttest{
#'     path_to_file <- system.file("extdata", "dictionary_exams.yaml", package = "labelmachine")
#'     dict <- lama_read(path_to_file) 
#'   }
#' @include utilities.R lama_dictionary.R
lama_read <- function(yaml_path) {
  err_handler <- composerr("Error while calling 'lama_read'")
  tryCatch(
    new_lama_dictionary(yaml_to_dictionary(yaml::read_yaml(yaml_path))),
    error = function(e) err_handler(e),
    warning = function(w) err_handler(w)
  )
}
