#' Filtered a data frame to the rows corresponding to the 10 most common values of a variable
#'
#' @param data A data frame.
#' @param x The variable in the data frame to filter on.
#'
#' @return The filtered data frame.
#' @examples
#' top10(camDogs, Dog_Name)
#' @export
top10 <- function(data, x){
  n <- NULL

  # Add in error if not character or factor for x
  x_vec <- data |>
    dplyr::pull({{ x }})
  if(!(is.character(x_vec) | is.factor(x_vec))){
    stop('x needs to be a character or factor vector')
  }


  # Find the 10 top based on x
  top10x <- dplyr::count(data, {{x}}) |>
    dplyr::slice_max(n = 10, order_by = n) |>
    dplyr::select({{x}}) |>
    dplyr::pull()

  # Filter dataset to only the 10 top based on x
  return(dplyr::filter(data, {{x}} %in% top10x))
}

