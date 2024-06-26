% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_effsize.R
\name{sm_effsize}
\alias{sm_effsize}
\title{Cohen's d - effect size}
\usage{
sm_effsize(group1, group2, absolute = TRUE)
}
\arguments{
\item{group1}{Numeric vector containing data from one sample (i.e., group 1)
that is to be compared with another group.}

\item{group2}{Numeric vector containing data from another sample (i.e., group 2)
that is to be compared with the former group.}

\item{absolute}{If set TRUE, the function will print the absolute value of the effect size.
If set FALSE, the function will print effect size of group2 - group1. For
example, it will be positive if group2 has a larger mean than group 1.}
}
\value{
Returns a double vector that is the effect size between two samples.
}
\description{
Cohen's d is a measure of the effect size.
It is often reported with p-values (ex. from a t-test or posthoc pairwise comparisons).
}
\examples{
library(smplot2)
group1 <- rnorm(10,0,1)
group2 <- rnorm(10,1,1)
sm_effsize(group1, group2)
}
