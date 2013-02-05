\name{schanBMLgrid-package}
\alias{schanBMLgrid-package}
\alias{schanBMLgrid}
\docType{package}
\title{
%% What the package does (short line)
%% ~~ package title ~~
Package for BML grid and associated functions
}
\description{
%% More about what it does (maybe more than one line)
%% ~~ A concise (1-5 lines) description of the package ~~
This function creates a BML grid and functions to move and update the
blue and red cars in the package.
}
\details{
\tabular{ll}{
Package: \tab schanBMLgrid\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-02-01\cr
License: \tab What license is it under?\cr
Depends: \tab methods\cr
}
The main functions in this package are \code{generateBMLgrid} which will
generate a \code{BMLgrid} object.  The dimensions and the cars in the
grid can be seen using \code{summary}, or
\code{getdim}, \code{redcars}, \code{bluecars}.  \code{plot} plots the
\code{BMLgrid} as an image.  \code{updateBlue},\code{updateRed} will
update either the blue or red cars by one time step.  At each time step,
the blue cars will move up by one unless they are blocked, and the red
cars will move right by one unless they are blocked.  They wrap around
when they get to the edge of the grid.
\code{updateManySteps} will update the cars by several steps.

}
\author{
Stephanie Chan

%% Maintainer: o to complain to <yourfault@somewhere.net>
Maintainer: Stephanie Chan <stechan@ucdavis.edu>
%%~~ The author and/or maintainer of the package ~~
}
\references{
%% ~~ Literature or other references for background information ~~
}
%% ~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
%% ~~ the R documentation directory ~~
\keyword{ package }
\seealso{
%% ~~ Optional links to other man pages, e.g. ~~
%% ~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{
%% ~~ simple examples of the most important functions ~~
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
plot(y)
}
