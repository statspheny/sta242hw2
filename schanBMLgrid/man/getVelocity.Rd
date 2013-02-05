\name{getVelocity}
\alias{getVelocity}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  Get car velocity
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  This function gets the average velocity of the cars after each move.
}
\usage{
getVelocity(oldPlace, newPlace)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{oldPlace}{
    %%     ~~Describe \code{oldPlace} here~~
    The old positions of the cars.
}
  \item{newPlace}{
    %%     ~~Describe \code{newPlace} here~~
    The new positions of the cars.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  A numeric showing the average velocity over all the cars.
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
  \code{\link{BMLgrid-class}},\code{\link{updateBlue}},\code{\link{updateRed}},\code{\link{updateManySteps}}
}
\examples{
x = generateBMLgrid(20,20,10,10)
y = updateRed(x)
getVelocity(redcars(x),redcars(y))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
