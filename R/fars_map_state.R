#' Plot State Map with Accident Locations
#'
#' The function plots the map of a specified state (``state.num``) with all its
#' accident locations of a specified ``year``. Invalid ``state.num`` will throw
#' an error. Nothing will be plotted or returned if a valid state does not have
#' any observations.
#'
#' @importFrom dplyr filter
#'
#' @importFrom maps map
#'
#' @importFrom graphics points
#'
#' @inheritParams make_filename
#'
#' @param state.num A numeric or integer specifying the number for which the
#'    is to be plotted.
#'
#' @return A plot of the state map for the specified state with all accident locations.
#'
#' @examples
#' \dontrun{
#' fars_map_state(34, 2013)
#' }
#'
#'
fars_map_state <- function(state.num, year) {

  STATE <- NULL
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}


