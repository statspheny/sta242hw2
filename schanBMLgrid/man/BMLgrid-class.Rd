\name{BMLgrid-class}
\Rdversion{1.1}
\docType{class}
\alias{BMLgrid-class}
\alias{as.data.frame,BMLgrid-method}
\alias{bluecars,BMLgrid-method}
\alias{getdim,BMLgrid-method}
\alias{plot,BMLgrid-method}
\alias{redcars,BMLgrid-method}
\alias{summary,BMLgrid-method}
\alias{updateBlue,BMLgrid-method}
\alias{updateRed,BMLgrid-method}

\title{Class \code{"BMLgrid"}}
\description{
  %%  ~~ A concise (1-5 lines) description of what the class is. ~~
  This class creates a BML object with a grid and a set of red cars and
  blue cars.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("BMLgrid", ...)}.
%%  ~~ describe objects here ~~

}
\section{Slots}{
  \describe{
    \item{\code{dim}:}{Object of class \code{"integer"} This is the
      dimension of the BMLgrid object.  The size of the traffic grid. }
    \item{\code{redcars}:}{Object of class \code{"integer"} This is a
    list of all the red cars in the BMLgrid object.}
    \item{\code{bluecars}:}{Object of class \code{"integer"} This is
      a list of all the blue cars in the BMLgrid object.}
  }
}
\section{Methods}{
  \describe{
    \item{as.data.frame}{\code{signature(x = "BMLgrid")}: ... }
    \item{bluecars}{\code{signature(obj = "BMLgrid")}: ... }
    \item{getdim}{\code{signature(obj = "BMLgrid")}: ... }
    \item{plot}{\code{signature(x = "BMLgrid")}: ... }
    \item{redcars}{\code{signature(obj = "BMLgrid")}: ... }
    \item{summary}{\code{signature(object = "BMLgrid")}: ... }
    \item{updateBlue}{\code{signature(obj = "BMLgrid")}: ... }
    \item{updateRed}{\code{signature(obj = "BMLgrid")}: ... }
	 }
}
\references{
%%  ~~put references to the literature/web site here~~
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
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("BMLgrid")
}
\keyword{classes}
