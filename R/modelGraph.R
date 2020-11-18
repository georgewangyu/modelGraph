#' Model a graph based on numeric dataset
#'
#' @name modelGraph
#'
#' @param data Dataset/tibble
#' @param x Numeric vector
#' @param y Numeric vector
#' @param model_type String for type of model function used
#' @param remove_na Boolean of whether to remove NA values
#' @param axis_title_color Axis title color
#' @param axis_title_size Axis title size
#' @param ... Ellipsis for other other arguments that can be used in ggplot
#'
#' @return
#' A ggplot graph which contains a model type of the given numeric dataset/tibble.
#'
#' @export
#' @examples
#'
#' plot_modelgraph(mtcars, cyl, mpg, model_type = "lm")

library(tidyverse)
plot_modelgraph <- function (data, x, y, model_type = "lm", remove_na = TRUE, axis_title_color = "black", axis_title_size = 12, ...) {
  if (!is.numeric(pull(data, {{ x }})) || !is.numeric(pull(data, {{ y }}))) {
    stop("'I am so sorry, but this function only works for numeric input!\n',
         'You have provided an object of class: ', x: class(x), y: class (y)")
  }

  graph <- ggplot(data, aes({{ x }}, {{ y }})) +
    geom_point(na.rm = remove_na) +
    geom_smooth(method = model_type) +
    theme(
      axis.title.x = element_text(color = axis_title_color, size = axis_title_size, ...),
      axis.title.y = element_text(color = axis_title_color, size = axis_title_size, ...))
  return (graph)
}


