\name{getdim}
\alias{getdim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  Get Dimension
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  Get the dimension of the grid in \code{BMLgrid} class.
}
\usage{
getdim(obj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
    %%     ~~Describe \code{obj} here~~
    \code{BMLgrid} class
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  Length 2 vector for integers representing the number of rows and
  number of columns in the \code{BMLgrid} class.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
  %%  ~~who you are~~
  Stephanie Chan
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  %% ~~objects to See Also as \code{\link{help}}, ~~~
  \code{\link{BMLgrid}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
structure(function (obj) 
standardGeneric("getdim"), generic = structure("getdim", package = "schanBMLgrid"), package = "schanBMLgrid", group = list(), valueClass = character(0), signature = "obj", default = `\001NULL\001`, skeleton = function (obj) 
stop("invalid call in method dispatch to 'getdim' (no default method)", 
    domain = NA)(obj), class = structure("standardGeneric", package = "methods"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
