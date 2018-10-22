#' Read compressed accident csv files of multiple years
#'
#' This function takes a vector as input that should specify the years of the
#' accident files. For every specified year, the filename is made, the file
#' is read and a tibble is created with only the columns ``MONTH`` and ``year``.
#' For each year that does not match an error is thrown. Furthermore the
#' function can only read data that sits in the current working directory.
#'
#' @importFrom dplyr mutate select
#' @import magrittr
#'
#' @param years A vector specifying the years of the accident csv files.
#'
#' @return A list of tibbles with the columns ``MONTH`` and ``year``.
#'
#' @examples
#' \dontrun{
#' fars_read_years(2014)
#' fars_read_years("2014")
#' fars_read_years(c(2013,2014))
#' }
#'
#'
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
