% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_add_text.R
\name{sm_add_text}
\alias{sm_add_text}
\title{Add a text annotation onto the combined plot}
\usage{
sm_add_text(
  label,
  x = 0.5,
  y = 0.5,
  angle = 0,
  color = "black",
  fontface = "plain",
  size = 10,
  ...
)
}
\arguments{
\item{label}{Text label in strings.}

\item{x}{Location of the text annotation along the x-axis of the combined figure. Default is the middle origin (0.5). Values from 0 to 1.}

\item{y}{Location of the text annotation along the y-axis of the combined figure. Default is the middle origin (0.5). Values from 0 to 1.}

\item{angle}{Angle of the text. Default is set to 0 (i.e., horizontal orientation).}

\item{color}{Color of the text. Default is set to 'black'.}

\item{fontface}{The default is to set the text as plain This can be changed, to
either "plain", "bold", "italic", "bold.italic" .}

\item{size}{Size of the text annotation}

\item{...}{Other parameters of the text that will be transferred to the function annotate()
from ggplot2.}
}
\value{
Prints a text in the combined plot.
}
\description{
Add a text annotation onto the combined plot
}
\examples{
library(smplot2)
library(ggplot2)
ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +
 geom_point(shape = 21, fill = '#0f993d', color = 'white',
            size = 3) -> p1

ggplot(data = mtcars, mapping = aes(x = drat, y = mpg)) +
 geom_point(shape = 21, fill = '#0f993d', color = 'white', size = 3) +
 sm_hvgrid() -> p2

combined_fig <- sm_put_together(list(p1,p2), ncol=2,nrow=1)
combined_fig + sm_add_text(label='My label', x = .5, y= .5)


}
