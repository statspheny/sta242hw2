newTrafficGrid = function(nrow,ncol) {
    ## This is a function that will 
    x = matrix(0,nrow=nrow,ncol=ncol)
    class(x) = "trafficGrid"
    return(x)
}

generateBMLgrid = function(nrow,ncol,prob) {
    n = nrow*ncol
    data = sample(c(0,1,-1),size=n,prob=c(1-prob,prob/2,prob/2),replace=TRUE)
    x = matrix(data,nrow=nrow,ncol=ncol)
    redval = which(x==-1)
    blueval = which(x==1)
    obj = list()
    obj$matrix = x
    obj$red = redval
    obj$blue = blueval
    class(obj) = "BMLgrid"
    return(obj)
}


changeCarProb = function(bgrid,prob) {
    ## This is a function that changes the probability of cars on the
    ## grid
    return(bgrid)
}


changeCarNumber = function(bgrid,nred=NULL,nblue=NULL) {
    ## This is a function that changes the number of red or blue cars
    ## on the grid.  If NULL, then the number of cars stays the same
    return(bgrid)
}


## Methods
summary.BMLgrid = function(BMLgrid) {
    print(BMLgrid)
}


plot.BMLgrid = function(obj) {
    red = "#FF0000FF"
    white = "#FFFFFFFF"
    blue = "#0000FFFF"
    shiftedmat = t(apply(obj$matrix,2,rev))
    image(shiftedmat,col=c(red,white,blue))
}

checkIfCarStuck = function(toMove,inPlace) {
    ## This function checks if the blue car is stopped behind a red car
    return(toMove %in% inPlace)
}
  
updateBlueCar = function(obj) {
    ## Each blue car moves up

    mat = obj$matrix
    nrow = nrow(mat)   # number of rows
    blueOld = obj$blue

    ## blueOld-1 moves the each car back one space
    ## !(blueOld%%ncol-1) is a logical for the cars at the end that reset
    ## add ncol to the cars that are reset
    blueMove = (blueOld-1) + as.numeric(blueOld%%nrow==1)*nrow
    
    ## keep the old indices for the cars that are stuck behind old cars
    stuckCars = checkIfCarStuck(blueMove,obj$red)
    blueMove[stuckCars] = blueOld[stuckCars]

    mat[blueOld]=0  #set old blue to zero 
    mat[blueMove]=1  #set new blue to 1

    obj$matrix = mat
    obj$blue = blueMove

    return(obj)
}



