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
  This function returns the dimension as a length two vector of integers
  representing the number of rows and number of columns in the
  \code{BMLgrid} class.
}
\value{
  length two integer vector for numRow and numCol
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
  \code{\link{BMLgrid-class}}
}
\examples{
x = generateBMLgrid(20,20,10,10)
getdim(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
