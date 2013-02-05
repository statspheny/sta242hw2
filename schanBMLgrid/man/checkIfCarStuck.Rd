\name{checkIfCarStuck}
\alias{checkIfCarStuck}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  check if car is stuck
}
\description{
  %% ~~ A concise (1-5 lines) description of what the function does. ~~
  The function checks which cars are stuck and returns a logical
  vector with TRUE for cars that are not stuck and FALSE for cars that
  are stuck
  
}
\usage{
checkIfCarStuck(toMove, filledSpots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{toMove}{
    %%     ~~Describe \code{toMove} here~~
    A vector of positions for the cars' next move.
}
  \item{filledSpots}{
    %%     ~~Describe \code{filledSpots} here~~
    A vector of positions of currently occupied spots.
}
}
\details{
  %%  ~~ If necessary, more details than the description above ~~
  This function will check if there is a car stuck in the place the
  car would be going to.  It will not check for a series of cars in a
  row.
  
}
\value{
  Returns a logical vector
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
}
\examples{
%% ##---- Should be DIRECTLY executable !! ----
%% ##-- ==>  Define data, use random,
%% ##--	or do  help(data=index)  for the standard data sets.

%% ## The function is currently defined as
%% function (toMove, filledSpots) 
%% {
%%     return(toMove \%in\% filledSpots)
%%   }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
