#' Nudge points.
#'
#' This is useful if you want to nudge labels a little ways from their
#' points.
#'
#' @family position adjustments
#' @param x,y Amount of vertical and horizontal distance to move.
#' @export
#' @examples
#' df <- data.frame(
#'   x = c(1,3,2,5),
#'   y = c("a","c","d","c")
#' )
#'
#' ggplot(df, aes(x, y)) +
#'   geom_point() +
#'   geom_text(aes(label = y))
#'
#' ggplot(df, aes(x, y)) +
#'   geom_point() +
#'   geom_text(aes(label = y), position = position_nudge(y = -0.1))
position_nudge <- function(x = 0, y = 0) {
  ggproto(NULL, PositionNudge,
    x = x,
    y = y
  )
}

#' @rdname ggplot2-ggproto
#' @format NULL
#' @usage NULL
#' @export
PositionNudge <- ggproto("PositionNudge", Position,
  x = NULL,
  y = NULL,

  compute_defaults = function(self, data) {
    check_required_aesthetics(c("x", "y"), names(data), "position_nudge")
    list()
  },

  adjust = function(self, data, params) {
    transform_position(data, function(x) x + self$x, function(y) y + self$y)
  }
)
