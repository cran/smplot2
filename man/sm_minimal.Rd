% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_minimal.R
\name{sm_minimal}
\alias{sm_minimal}
\title{SM minimal theme (no grid) with borders.}
\usage{
sm_minimal(legends = FALSE)
}
\arguments{
\item{legends}{If the legend needs to be displayed, the input should be TRUE.
If the legend is not needed, the input should be FALSE.}
}
\value{
Returns a background theme that has no grids (ggplot2 output).
}
\description{
This theme has no major grid.
}
\examples{

library(ggplot2)
library(smplot2)
ggplot(data = mpg) +
geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
sm_minimal()

}
