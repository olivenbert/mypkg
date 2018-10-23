#' Count monthly observations in accident data
#'
#' This function uses the function ``fars_read_years()`` to read all accident
#' csv files specified via parameter ``years`` and counts the number of observations
#' in each month.
#'
#' @importFrom dplyr bind_rows group_by summarize
#'
#' @importFrom tidyr spread
#'
#' @inheritParams fars_read_years
#'
#' @return A tibble data.frame with one row per month  and one column per year.
#'
#' @examples
#' \dontrun{
#' fars_summarize_years(c(2013,2014))
#' }
#'
fars_summarize_years <- function(years) {
  year <- MONTH <- n <- NULL
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = dplyr::n()) %>%
    tidyr::spread(year, n)
}
