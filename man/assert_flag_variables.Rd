% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{assert_flag_variables}
\alias{assert_flag_variables}
\title{Check Values of Flag Variables}
\usage{
assert_flag_variables(df, flag_vars, na_level = "<Missing>")
}
\arguments{
\item{df}{(\code{data.frame})\cr data required to build table.}

\item{flag_vars}{(\code{vector} of \code{character})\cr names of flag variables within \code{df} to check.}

\item{na_level}{(\code{character})\cr string to represent missing values.}
}
\description{
Flag variables are expected to take one of two values: \code{"Y"} (yes/true) or
\code{"N"} (no/false). Missing values are also accepted and treated as \code{"N"}.
}
\examples{
adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
falcon:::assert_flag_variables(adsl, c("SAFFL", "ITTFL"))

}
\keyword{internal}
