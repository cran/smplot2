% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_hist.R
\name{sm_hist}
\alias{sm_hist}
\title{Histogram with kernel density estimation (Gaussian) and rugs}
\usage{
sm_hist(
  ...,
  hist.params = list(binwidth = 1/2, fill = sm_color("blue"), color = "white", alpha =
    0.4),
  density.params = list(color = sm_color("blue"), size = 0.8, fill = "transparent"),
  rug.params = list(color = sm_color("blue"), alpha = 0.8, size = 0.4),
  histogram = TRUE,
  density = TRUE,
  rug = TRUE,
  borders = FALSE,
  legends = FALSE,
  forget = FALSE
)
}
\arguments{
\item{...}{A generic aesthetic parameter across points and the boxplot. This is optional.}

\item{hist.params}{List of parameters for the histogram, such as binwidth, color, alpha, fill etc.}

\item{density.params}{List of parameters for the density estimation, such as color, size, alpha etc}

\item{rug.params}{List of parameters for the rugs, such as color, size, alpha etc}

\item{histogram}{TRUE if the histogram needs to be shown.
FALSE if the histogram needs to be hidden.}

\item{density}{TRUE if the density plot needs to be shown.
FALSE if the density plot needs to be hidden.}

\item{rug}{TRUE if the rugs need to be shown.
FALSE if the rugs need to be hidden.}

\item{borders}{If the border needs to be displayed, the input should be TRUE.
If the border is not needed, the input should be FALSE.}

\item{legends}{If the legend needs to be displayed, the input should be TRUE.
If the legend is not needed, the input should be FALSE.}

\item{forget}{Forget the defaults when list() is called for a specific parameter.
Set to TRUE when when users want to map aesthetics to different groups more flexibly..
Set to FALSE by default.}
}
\value{
Returns a histogram generated using ggplot2.
}
\description{
Histogram with kernel density estimation (Gaussian) and rugs
}
\examples{
library(ggplot2)
library(smplot2)
set.seed(2)
data=data.frame(value=rnorm(1000))
data2 = data.frame(value=rnorm(1000,5,1))

data$day <- 'day1'
data2$day <- 'day2'
rbind(data,data2) -> df

ggplot(data = data, aes(x=value)) +
sm_hist()

ggplot(data = df, aes(x=value, fill=day, color = day)) +
sm_hist(hist.params = list(binwidth = 1/2, alpha = 0.3),
       density.params = list(fill='transparent', size = 0.8),
       rug.params = list(alpha = 0.8)) +
 scale_color_manual(values = sm_palette(2)) +
  scale_fill_manual(values = sm_palette(2))

}
