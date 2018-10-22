#' Read a csv file
#'
#' The functions can take the path to a csv file or a compressed csv file as input
#' and returns it as a tibble. Messages and progress status are not printed.
#' Execution stops if the specified file does not exist.
#'
#' @import readr read_csv
#'
#' @param filename A character string specifying the file path.
#'
#' @return A tibble data.frame.
#'
#' @examples
#' \dontrun{
#' fars_read("data/accident_2013.csv.bz2")
#' }
#'
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
