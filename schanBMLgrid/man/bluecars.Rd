\name{bluecars}
\alias{bluecars}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  returns bluecars
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  This function returns the list of all the blue cars in the format
  it is stored.
}
\usage{
bluecars(obj, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
    %%     ~~Describe \code{obj} here~~
    \code{obj} must be a BMLgrid object
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  returns a vector of blue cars.
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
  \code{\link{BMLgrid-class}},\code{\link{redcars}}
}
\examples{
x = generateBMLgrid(20,20,10,10)
plot(x)
bluecars(x)
redcars(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
