\name{generateBMLgrid}
\alias{generateBMLgrid}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  Generate BMLgrid
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  This function generates a BMLgrid according to the \code{BMLgrid}
  class.  It will create the BMLgrid by the parameters given in the
  input.
  
}
\usage{
generateBMLgrid(nrow, ncol, nred, nblue)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nrow}{
    %%     ~~Describe \code{nrow} here~~
    number of rows in the \code{BMLgrid} object
}
  \item{ncol}{
    %%     ~~Describe \code{ncol} here~~
    number of columns in the \code{BMLgrid} object
}
  \item{nred}{
    %%     ~~Describe \code{nred} here~~
    number of red cars in the \code{BMLgrid} object
}
  \item{nblue}{
    %%     ~~Describe \code{nblue} here~~
    number of blue cars in the \code{BMLgrid} object
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Returns a \code{BMLgrid} object.
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
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (nrow, ncol, nred, nblue) 
{
    n = nrow * ncol
    ncars = nred + nblue
    cars = sample(1:n, ncars)
    redcars = sample(cars, nred)
    bluecars = cars[!(cars \%in\% redcars)]
    obj = new("BMLgrid", dim = as.integer(c(nrow, ncol)),
        redcars = redcars, bluecars = bluecars)
    return(obj)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
