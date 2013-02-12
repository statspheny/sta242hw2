\name{updateBlue}
\alias{updateBlue}
\alias{updateBlueWithC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  Update blue cars
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  This function updates the blue cars in the \code{BMLgrid} object.  The
  blue cars move up by one step.  If the blue car is at the top, then it
  cycles to the bottom of that column.
}
\usage{
updateBlue(obj, ...)
updateBlueWithC(obj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
    %%     ~~Describe \code{obj} here~~
    \code{BMLgrid} object
}
  \item{\dots}{
    %%     ~~Describe \code{\dots} here~~
}
}
\details{
  %%  ~~ If necessary, more details than the description above ~~
  \code{updateBlue} uses only R, but \code{updateBlueWithC} calls C to
  do the updating.
}
\value{
  A \code{BMLgrid} object with all the blue cars updated.
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
  \code{\link{updateRed}}, \code{\link{updateRedWithC}}, \code{\link{updateManySteps}},
  \code{\link{updateManyStepsWithC}}
  
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
