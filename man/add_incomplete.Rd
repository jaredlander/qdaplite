% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/add_incomplete.R
\name{add_incomplete}
\alias{add_incomplete}
\title{Detect Incomplete Sentences; Add | Endmark}
\usage{
add_incomplete(text.var, endmarks = "[.?|!]+$", silent = FALSE)
}
\arguments{
\item{text.var}{The text variable.}

\item{endmarks}{A reguar expression to check for endmarks.}

\item{silent}{logical.  If \code{TRUE} messages are not printed out.}
}
\value{
Returns a vector with missing endmarks replaced with \code{|}.
}
\description{
Automatically detect missing endmarks and replace with the \code{|} endmark
symbol to indicate an incomplete sentence.
}
\examples{
add_incomplete(
    c(
        "This in a",
        "I am funny!",
        "An ending of sorts\%",
        "What do you want?"
    )
)
}
\keyword{endmark}

