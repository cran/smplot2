#' A Boxplot with Jittered Individual Points
#'
#' `sm_boxplot` generates a boxplot with optional jittered individual points using ggplot2.
#' This function allows users to customize the aesthetics of the boxplot and points
#' separately and provides an option to control the default behavior via the `forget` argument.
#'
#' @param ...
#' Additional aesthetic parameters applied to both the boxplot and individual points.
#' These parameters are optional and allow global customization.
#'
#' @param boxplot.params
#' A list of parameters for customizing the boxplot appearance, such as `fill`, `color`,
#' `size`, `width`, and `outlier.shape`. The default is:
#' `list(notch = FALSE, fill = 'gray95', color = 'black', size = 0.5, width = 0.5, outlier.shape = NA)`.
#'
#' @param point.params
#' A list of parameters for customizing the individual points, such as `alpha`, `size`,
#' and `shape`. The default is: `list(alpha = 0.65, size = 2)`.
#'
#' @param point_jitter_width
#' A numeric value specifying the degree of horizontal jitter applied to individual points.
#' If set to `0`, points are aligned along the y-axis without jitter. Default is `0.12`.
#'
#' @param points
#' Logical. If `TRUE` (default), individual points are displayed. If `FALSE`, points are hidden.
#'
#' @param borders
#' Logical. If `TRUE` (default), grid borders are displayed. If `FALSE`, borders are removed.
#'
#' @param legends
#' Logical. If `TRUE`, legends are displayed. If `FALSE` (default), legends are hidden.
#'
#' @param seed
#' A numeric value for setting a random seed to make jittered points reproducible.
#' Default is `NULL` (no seed).
#'
#' @param forget
#' Logical. If `TRUE`, ignores the default aesthetic parameters (`boxplot.params`
#' and `point.params`) and applies only the provided customization through `list(...)`.
#' If `FALSE` (default), merges the provided parameters with the defaults.
#'
#' @import ggplot2 cowplot
#' @importFrom utils modifyList
#' @return
#' A list of ggplot layers that can be added to a ggplot object to create a customized
#' boxplot with optional jittered points.
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(smplot2)
#' set.seed(1) # generate random data
#' day1 <- rnorm(16, 2, 1)
#' day2 <- rnorm(16, 5, 1)
#' Subject <- rep(paste0("S", seq(1:16)), 2)
#' Data <- data.frame(Value = matrix(c(day1, day2), ncol = 1))
#' Day <- rep(c("Day 1", "Day 2"), each = length(day1))
#' df <- cbind(Subject, Data, Day)
#'
#' # with the default aesthetics of smplot
#' ggplot(data = df, mapping = aes(x = Day, y = Value, color = Day)) +
#'   sm_boxplot() +
#'   scale_color_manual(values = sm_color("blue", "orange"))
#'
#' # Without the default aesthetics of smplot
#'
#' ggplot(data = df, mapping = aes(x = Day, y = Value, color = Day)) +
#'   sm_boxplot(boxplot.params = list()) +
#'   scale_color_manual(values = sm_color("blue", "orange"))
sm_boxplot <- function(...,
                       boxplot.params = list(
                         notch = FALSE, fill = "gray95", color = "black",
                         size = 0.5, width = 0.5, outlier.shape = NA
                       ),
                       point.params = list(alpha = 0.65, size = 2),
                       point_jitter_width = 0.12, points = TRUE,
                       borders = TRUE, legends = FALSE, seed = NULL,
                       forget = FALSE) {
  if (length(seed)) set.seed(seed)

  params <- list(...)

  if (forget == FALSE) {
    boxplot.params0 <- list(
      notch = FALSE, fill = "gray95", color = "black",
      size = 0.5, width = 0.5, outlier.shape = NA
    )
    boxplot.params0 <- modifyList(boxplot.params0, params)

    point.params0 <- list(alpha = 0.65, size = 2)
    point.params0 <- modifyList(point.params0, params)

    boxplot.params <- modifyList(boxplot.params0, boxplot.params)
    point.params <- modifyList(point.params0, point.params)
  } else if (forget == TRUE) {
    boxplot.params <- modifyList(params, boxplot.params)
    point.params <- modifyList(params, point.params)
  }



  boxPlot <- do.call(
    "geom_boxplot",
    modifyList(list(), boxplot.params)
  )

  pointPlot <- do.call(
    "geom_point",
    modifyList(list(position = position_jitter(
      height = 0,
      width = point_jitter_width
    )), point.params)
  )
  if (points == FALSE) {
    pointPlot <- NULL
  }

  list(
    boxPlot, pointPlot,
    sm_hgrid(borders = borders, legends = legends)
  )
}
