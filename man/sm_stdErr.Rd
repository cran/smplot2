% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sm_stdErr.R
\name{sm_stdErr}
\alias{sm_stdErr}
\title{Standard error}
\usage{
sm_stdErr(data)
}
\arguments{
\item{data}{Numerical vector of data.}
}
\value{
A double vector is returned with a standard error of the input (given sample).
}
\description{
Standard error
}
\examples{
library(smplot2)
sm_stdErr(rnorm(10,0,1))



}
