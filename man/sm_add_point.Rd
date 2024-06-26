% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_add_point.R
\name{sm_add_point}
\alias{sm_add_point}
\title{Add a point annotation onto the combined plot}
\usage{
sm_add_point(x, y, size = 10, shape = 16, color = "black", ...)
}
\arguments{
\item{x}{Location of the point annotation along the x-axis of the combined figure. Default is the middle origin (0.5). Values from 0 to 1.}

\item{y}{Location of the point annotation along the y-axis of the combined figure. Default is the middle origin (0.5). Values from 0 to 1.}

\item{size}{Size of the point}

\item{shape}{Shape of the point. Default is set to circle without border (16).}

\item{color}{Color of the point. Default is set to black.}

\item{...}{Other parameters of point that get passed to geom_point().}
}
\value{
Prints a point in the combined plot.
}
\description{
Add a point annotation onto the combined plot
}
\examples{
library(ggplot2)
library(smplot2)

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +
geom_point(shape = 21, fill = '#0f993d', color = 'white',
          size = 3) -> p1

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +
 geom_point(shape = 21, fill = '#0f993d', color = 'white', size = 3) +
 sm_hvgrid() -> p2

combined_fig <- sm_put_together(list(p1,p2), ncol=2,nrow=1)
combined_fig + sm_add_point(color='red', size = 10, x = .5, y= .5)
}
