\name{updateRed}
\alias{updateRed}
\alias{updateRedWithC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  Update red cars
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  This function updates the red cars in the \code{BMLgrid} object.  The
  red cars move up by one step.  If the red car is at the right edge,
  then it cycles to the left edge of that row.
}
\usage{
updateRed(obj, ...)
updateRedWithC(obj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
    %%     ~~Describe \code{obj} here~~
    The \code{BMLgrid} object that for the red cars to move.
}
  \item{\dots}{
    %%     ~~Describe \code{\dots} here~~
}
}
\details{
  %% ~~ If necessary, more details than the description above ~~
  \code{updateRed} uses only R, and \code{updateRedWithC} calls C to do
  the updating.
}
\value{
  A \code{BMLgrid} object with all the red cars updated.
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
  \code{\link{updateBlue}}, \code{\link{updateBlueWithC}},
  \code{\link{updateManySteps}}, \code{\link{updateManyStepsWithC}}
}
\examples{

x = generateBMLgrid(20,20,10,10)
plot(x)
print(bluecars(x))
print(redcars(x))

x=updateBlue(x)
plot(x)
print(bluecars(x))

x=updateRed(x)
plot(x)
print(redcars(x))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
