% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_bar2.R
\name{sm_bar}
\alias{sm_bar}
\title{A bar plot with jittered individual points}
\usage{
sm_bar(
  ...,
  bar.params = list(width = 0.7, alpha = 1, color = "transparent", fill = "gray80"),
  err.params = list(linewidth = 1, color = "black"),
  point.params = list(size = 2.5, alpha = 0.65, shape = 16),
  errorbar_type = "se",
  point_jitter_width = 0.12,
  points = TRUE,
  borders = TRUE,
  legends = FALSE,
  seed = NULL,
  forget = FALSE
)
}
\arguments{
\item{...}{A generic aesthetic parameter across points and the boxplot. This is optional.}

\item{bar.params}{List of parameters for the bar graph, such as color, alpha, fill etc}

\item{err.params}{List of parameters for the error bar, such as color, size, alpha etc}

\item{point.params}{List of parameters for individual points, such as color, alpha, fill etc}

\item{errorbar_type}{This argument determines the errorbar type.
If it is set to 'se', standard error bar will be shown.
If it is set to 'sd' (default), the error bar will display standard deviation.
If it is set to 'ci', the error bar will display 95\% confidence interval.}

\item{point_jitter_width}{A numerical value that determines the degree of the jitter for each point. If its 0,
all the points will have no jitter (aligned along the y-axis).}

\item{points}{TRUE if points need to be shown.
FALSE if points need to be hidden.}

\item{borders}{If the border needs to be displayed, the input should be TRUE.
If the border is not needed, the input should be FALSE.}

\item{legends}{If the legend needs to be displayed, the input should be TRUE.
If the legend is not needed, the input should be FALSE.}

\item{seed}{Random seed. Requires a number.}

\item{forget}{Forget the defaults when list() is called for a specific parameter (ex. point.params).
Set to TRUE when when users want to map aesthetics to different groups more flexibly..
Set to FALSE by default.}
}
\value{
A bar graph generated using ggplot2
}
\description{
A bar plot with jittered individual points
}
\examples{
library(smplot2)
library(ggplot2)
set.seed(1) # generate random data
day1 = rnorm(16,2,1)
day2 = rnorm(16,5,1)
Subject <- rep(paste0('S',seq(1:16)), 2)
Data <- data.frame(Value = matrix(c(day1,day2),ncol=1))
Day <- rep(c('Day 1', 'Day 2'), each = length(day1))
df <- cbind(Subject, Data, Day)

# with aesthetic defaults of smplot
ggplot(data = df, mapping = aes(x = Day, y = Value, color = Day)) +
sm_bar() +
scale_color_manual(values = sm_color('blue','orange'))

}
