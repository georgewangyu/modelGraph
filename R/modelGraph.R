#' Model a graph based on numeric dataset
#'
#' @name modelGraph
#'
#' @param data tibble
#' @param x Numeric column
#' @param y Numeric column
#' @param model_type String for type of model function used
#' @param remove_na Boolean of whether to remove NA values
#' @param axis_title_color Axis title color
#' @param axis_title_size Axis title size
#' @param ... Ellipsis for other other arguments that can be used in ggplot
#'
#' @return
#' A ggplot graph which contains a model type of the given numeric tibble.
#'
#' @export
#' @examples
#' plot_modelgraph(mtcars, cyl, mpg, model_type = "lm")

plot_modelgraph <- function (data, x, y, model_type = "lm", remove_na = TRUE, axis_title_color = "black", axis_title_size = 12, ...) {
  if (!is.numeric(dplyr::pull(data, {{ x }})) || !is.numeric(dplyr::pull(data, {{ y }}))) {
    stop("'I am so sorry, but this function only works for numeric input!\n',
         'You have provided an object of class: ', x: class(x), y: class (y)")
  }

  graph <- ggplot2::ggplot(data, ggplot2::aes({{ x }}, {{ y }})) +
    ggplot2::geom_point(na.rm = remove_na) +
    ggplot2::geom_smooth(method = model_type) +
    ggplot2::theme(
      axis.title.x = ggplot2::element_text(color = axis_title_color, size = axis_title_size, ...),
      axis.title.y = ggplot2::element_text(color = axis_title_color, size = axis_title_size, ...))
  return (graph)
}


