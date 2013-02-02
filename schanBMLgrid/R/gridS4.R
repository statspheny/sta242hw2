## This is a BMLgrid object
setClass("BMLgrid",representation(dim="integer",
                                  redcars="integer",bluecars="integer"),
         prototype(dim=c(0L,0L),redcars=NULL,bluecars=NULL))


generateBMLgrid = function(nrow,ncol,nred,nblue) {
    ## newBMLgrid: function to create a BMLgrid with dimensions nrow x ncol
    ## and randomly selected red and blue cars
    ## nred is the number of red cars, and nblue is the number of blue cars

    ## randomly sample from nrow*ncol to get the correct number of red and blue cars
    n = nrow*ncol
    ncars = nred+nblue
    ## 1. randomly get ncars
    ## 2. of ncars, select the red ones
    ## 3. set the rest to be blue
    cars = sample(1:n,ncars)  
    redcars = sample(cars,nred)
    bluecars = cars[!(cars %in% redcars)]

    obj = new("BMLgrid",dim=as.integer(c(nrow,ncol)),redcars=redcars,bluecars=bluecars)
    return(obj)
}


setMethod("plot","BMLgrid",
          # This function plots the BMLgrid object with red and blue
          # cars in an image plot
          function(gridobj,x,y,...) {             

              # make the BMLgrid into a matrix with -1 for red cars and 1 for blue cars
              dim = gridobj@dim
              mat = matrix(0,dim[1],dim[2])

              mat[gridobj@redcars]=-1
              mat[gridobj@bluecars]=1

              # shift the matrix so it shows up right side up.
              shiftedmat = t(apply(mat,2,rev))
                            
              red = "#FF0000FF"
              white = "#FFFFFFFF"
              blue = "#0000FFFF"

              image(shiftedmat,col=c(red,white,blue),xaxt='n',yaxt='n',...)
          })

checkIfCarStuck = function(toMove,filledSpots) {
    ## This function checks if the toMove cars are stuck behind an
    ## inPlace car.
    return(toMove %in% filledSpots)
}

setGeneric("getdim",function(obj) standardGeneric("getdim"))

setMethod("getdim","BMLgrid",
          function(obj) obj@dim )

setGeneric("redcars",function(obj) standardGeneric("redcars"))

setMethod("redcars", "BMLgrid",
          function(obj) obj@redcars )

setGeneric("bluecars",function(obj,...) standardGeneric("bluecars"))

setMethod("bluecars", "BMLgrid",
          function(obj,...) obj@bluecars )

setGeneric("updateBlue", function(obj,...) standardGeneric("updateBlue"))

setMethod("updateBlue","BMLgrid",
          ## Blue cars move one space up
          function(obj,...) {
    
              nrow = dim(obj)[1]
              blueOld = bluecars(obj)


              ## Move each car up by 1 spot
              ## If car is at top, then add nrow, move to end of line
              blueMove = blueOld-1 + as.integer(blueOld%%nrow==1)*nrow

              ## For debugging purposes
              ## print("blueOld")
              ## print(blueOld)
              ## print("blueMove")
              ## print(blueMove)

              ## print(blueOld-1)
              ## print(as.integer(blueOld%%nrow==1)*nrow)

              ## stuck cars do not move, because there is already some
              ## blue or red cars in their place
              stuckCars = checkIfCarStuck(blueMove,c(obj@bluecars,obj@redcars))
              blueMove[stuckCars] = blueOld[stuckCars]

              ## update the blue cars
              obj@bluecars = as.integer(blueMove)

              return(obj)
          })

setGeneric("updateRed", function(obj,...) standardGeneric("updateRed"))

setMethod("updateRed","BMLgrid",
          ## red cars move one space to the right
          function(obj,...) {
              
              d = dim(obj)
              nrow = d[1]
              n = d[1]*d[2]
              redOld = redcars(obj)

              ## Move each car right 1 spot, so nrow spaces
              ## If car is at the end, move to first line
              redMove = (redOld+nrow)
              redMove[redMove>n] = redMove[redMove>n]-n

              ## For debugging purposes
              ## print("redOld")
              ## print(redOld)
              ## print("redMove")
              ## print(redMove)
              ## print(nrow)
              ## print(n)

              ## stuck cars do not move
              stuckCars = checkIfCarStuck(redMove, c(obj@redcars,obj@bluecars))
              redMove[stuckCars] = redOld[stuckCars]

              ## update the red cars
              obj@redcars = as.integer(redMove)

              return(obj)
          })


setMethod("summary","BMLgrid",
          function(object,...) {
              cat("BMLgrid:\n")
              cat(paste("dim:",object@dim[1],"x",object@dim[2],"\n"))
              cat(paste(length(object@bluecars),"blue cars\n"))
              cat(paste(length(object@redcars),"red cars\n"))
          })
    

setMethod("as.data.frame","BMLgrid",
          function(x,...) {

              brow = x@bluecars %% x@dim[1]
              bcol = floor(x@bluecars / x@dim[2]) + 1
              bn = length(x@bluecars)

              rrow = x@redcars %% x@dim[1]
              rcol = floor(x@redcars / x@dim[2]) + 1
              rn = length(x@redcars)

              df = data.frame(color=c(rep("blue",bn),rep("red",rn)),
                row=c(brow,rrow),
                col=c(bcol,rcol))
          })
              

checkMoves = function(oldPlace,newPlace) {
    newPlace-oldPlace
}

getVelocity = function(oldPlace,newPlace) {
    if(length(oldPlace)!=length(newPlace))
      stop("oldPlace and newPlace different lengths")
    return(sum(oldPlace!=newPlace)/length(oldPlace))
}


## updateManySteps = function(obj,numsteps) {
##     ## This function updates the BMLgrid many steps

##     ## for every two steps, update blue, then update red
##     for(i in 1:floor(numsteps/2)) {
##         obj = updateBlue(obj)
##         obj = updateRed(obj)
##     }

##     ## if numsteps is odd, then update blue again, else, finish
##     if(!numsteps%%2) 
##         obj = updateBlue(obj)

##     return(obj)
## }


updateManySteps = function(obj,numsteps,video=FALSE) {
    ## This function updates the BMLgrid many steps
    ## Blue moves first

    if(class(obj)!="BMLgrid")
      stop('not BMLgrid')

    if(video)
      plot(obj)
   
    toMove = "blue"

    for(i in 1:numsteps) {

        if(video) {
            dev.hold()
            Sys.sleep(1)
        }

        if(toMove=="blue") {
          obj=updateBlue(obj)
          toMove="red"
        } else if(toMove=="red") {
          obj = updateRed(obj)
          toMove="blue"
        }

        if(video) {
            plot(obj)
            dev.flush()
        }
    }

    return(obj)

}
