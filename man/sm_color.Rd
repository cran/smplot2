% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_color.R
\name{sm_color}
\alias{sm_color}
\title{SM custom palette of colors}
\usage{
sm_color(...)
}
\arguments{
\item{...}{The input has to be a character string.of a color name.
There are 20 colors available from the SM palette:
`'blue'`,`'crimson'`, `'green'`, `'purple'`, `'orange'`,
`'skyblue'`, `'pink'`, `'limegreen'`, `'lightpurple'`,
`'brown'`, `'red'`, `'lightbrown'`,
`'asparagus'`, `'viridian'`, `'darkred'`, `'lightblue'`,
`'light blue'`, `'wine'`, `'yellow'`, `'lightgreen'`}
}
\value{
A character/string of hex codes
}
\description{
This is a custom color palette that SM recommends for data visualization.
It returns up to 20 different colors with a high visibility.
}
\examples{
library(smplot2)
sm_color('crimson')

sm_color('crimson', 'green', 'blue')
}
