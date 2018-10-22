#' Create filename of a compressed csv-file
#'
#' The functions takes an input string that should specify the year and
#' returns the filename of the accident data for the specified year.
#'
#' @param year A numeric, integer, character or factor that should specify the year.
#'    If multiple filenames are to be provided, input needs to be provided as vector.
#'
#' @return A character string representing the filename of a compressed accident
#'   csv for the specified year.
#'
#' @examples
#' \dontrun{
#' make_filename(2013)
#' }
#'
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
