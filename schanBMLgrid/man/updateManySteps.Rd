\name{updateManySteps}
\alias{updateManySteps}
\alias{updateManyStepsWithC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  %%  ~~function to do ... ~~
  Update by many steps.
}
\description{
  %%  ~~ A concise (1-5 lines) description of what the function does. ~~
  This function updates the \code{BMLgrid} by several steps.  If the
  \code{video} flag is \code{TRUE} then it will display a video of the
  updating cars.
  
}
\usage{
updateManySteps(obj, numSteps, video = FALSE)
updateManyStepsWithC(obj,numSteps)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
    %%     ~~Describe \code{obj} here~~
    \code{BMLgrid} object with cars to move.
}
  \item{numSteps}{
    %%     ~~Describe \code{numsteps} here~~
    The number of steps to move the cars.
}
  \item{video}{
    %%     ~~Describe \code{video} here~~
    A flag.  If \code{TRUE}, then will display a video of the movements.
    If \code{FALSE}, then will not display video.
}
}
\details{
  %%  ~~ If necessary, more details than the description above ~~
  \code{updateManySteps} uses R and has potential for a video.
  \code{updateManyStepsWithC} calls C to do the updating and returns the
  object with the new red and blue car positions.  Both functions start
  updating with the blue cars first.  If the first update step should be
  with the red cars, then first call \code{updateRed} and then call
  \code{updateManySteps}.  
}
\value{
  The updated \code{BMLgrid} object after updating several steps.
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
  \code{\link{updateRed}}, \code{\link{updateRedWithC}}
}
\examples{

y = generateBMLgrid(20,20,10,10)
print(redcars(y))
print(bluecars(y))
plot(y)

y = updateRed(y)
print(redcars(y))
y = updateBlue(y)
print(bluecars(y))
plot(y)

y = updateManySteps(y,10)
print(redcars(y))
print(bluecars(y))
plot(y)

y = updateManySteps(y,20,video=TRUE)


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
