% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_slope_mean.R
\name{sm_slope_mean}
\alias{sm_slope_mean}
\title{A slope chart (with mean) of one group}
\usage{
sm_slope_mean(
  ...,
  labels,
  group,
  main_color = sm_color("blue"),
  main_shape = 21,
  back_alpha = 0.25,
  line_width = 0.25,
  avgline_width = 1,
  point_size = 2.5,
  avgpoint_size = 4,
  err_width = 1,
  xTick.params = list(position = "top", expand = c(0.17, 0.1), drop = FALSE),
  errorbar_type = "sd",
  show_err = FALSE,
  legends = FALSE
)
}
\arguments{
\item{...}{List of parameters for individual points and lines across different elements
(except for except for xTick.params), such as color, alpha, fill etc.}

\item{labels}{Labels for the ticks of the x-axis. This is a required argument.
It has to be a single vector containing either one
or multiple elements. ex: c('Day 1', 'Day 2')}

\item{group}{Name of the variable by which the individual data should be grouped}

\item{main_color}{Main color of the slope chart. Shared across points, lines and error bars.}

\item{main_shape}{Main shape of the points in the slope chart.}

\item{back_alpha}{Transparency of the shadow (individual lines and points) from the back.}

\item{line_width}{Line width of the line that connects points in the back shadow}

\item{avgline_width}{Average's linewidth of the line that connects points in the back shadow}

\item{point_size}{Size of the points in the back from the shadow}

\item{avgpoint_size}{Size of the points representing the mean of the data}

\item{err_width}{Linewidth of the errorbars}

\item{xTick.params}{List of parameters for the x tick from the average plot, such as color, alpha etc}

\item{errorbar_type}{This argument determines the errorbar type.
If it is set to 'se', standard error bar will be shown.
If it is set to 'sd' (default), the error bar will display standard deviation.
If it is set to 'ci', the error bar will display 95\% confidence interval.}

\item{show_err}{If the error bar needs to be displayed, the input should be TRUE.
If the error bar is not needed, the input should be FALSE.}

\item{legends}{If the legend needs to be displayed, the input should be TRUE.
If the legend is not needed, the input should be FALSE.}
}
\value{
Returns a slope chart which is a ggplot2 object.
}
\description{
This function provides an easy way to plot slope chart with mean. This can
also be reproduced using sm_slope().
}
\details{
This is very useful for comparing the effect between two time points of
one group.

ggplot()'s mapping has to be quite specific: each observation has to be grouped.

Error bar types can be specified (ci, sd, and se).
}
\examples{
library(ggplot2)
library(smplot2)

set.seed(1) # generate random data
day1 = rnorm(16,2,1)
day2 = rnorm(16,5,1)
Subject <- rep(paste0('S',seq(1:16)), 2)
Data <- data.frame(Value = matrix(c(day1,day2),ncol=1))
Day <- rep(c('Day 1', 'Day 2'), each = length(day1))
df <- cbind(Subject, Data, Day)

ggplot(data=df, aes(x = Day, y = Value)) +
 sm_slope_mean(labels = c('Day 1', 'Day 2'), group = Subject, back_alpha = .3,
main_color = sm_color('green'))
}
