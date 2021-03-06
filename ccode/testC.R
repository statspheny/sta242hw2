## source("RMoveCars.R")

library(schanBMLgrid)

#########################################################################
## First set of tests to see if the bluecars and redcars work with the ##
## C updates.                                                          ##
#########################################################################
firstTest = FALSE

if (firstTest) {
    set.seed(100)
    x = generateBMLgrid(5,5,5,5)
    print(bluecars(x))

    par(mfrow=c(2,2))
    plot(x)
    
    y1 = updateRedWithC(x)
    print(redcars(y1))
    plot(y1)

    y2 = updateBlueWithC(y1)
    print(bluecars(y2))
    plot(y2)

    y3 = updateRedWithC(y2)
    print(redcars(y3))
    plot(y3)
}



########################################################################
## Here is a funtion to test if the C routine returns the same values ##
## as the R function.  It updates blue and red each two times and     ##
## checks if each result is equivalent for R and C                    ##
########################################################################
testRandomGrid = function(seed) {

    ## generate a random grid
    ## print(seed)
    set.seed(seed)
    dim = sample(2:100,2)
    size = prod(dim)
    numCars = sample(1:(size/2),2)
    
    grid = generateBMLgrid(dim[1],dim[2],numCars[1],numCars[2])
    ## summary(grid)

    ## update the grid using R
    gridR1 = updateBlue(grid)
    gridR2 = updateRed(gridR1)
    gridR3 = updateBlue(gridR2)
    gridR4 = updateRed(gridR3)

    ## update the grid using C
    gridC1 = updateBlueWithC(grid)
    gridC2 = updateRedWithC(gridC1)
    gridC3 = updateBlueWithC(gridC2)
    gridC4 = updateRedWithC(gridC3)

    allgrids = list(grid,gridR1,gridC1,gridR2,gridC2,gridR3,gridC3,gridR4,gridC4)

    ## par(mfrow=c(3,3))

    ## for(i in 1:9) {
    ##     plot(allgrids[[i]],main = i)
    ## }


    ## print(paste("R1=C1",identical(gridR1,gridC1)))
    ## print(paste("R2=C2",identical(gridR2,gridC2)))
    ## print(paste("R3=C3",identical(gridR3,gridC3)))
    ## print(paste("R4=C4",identical(gridR4,gridC4)))

    ## check if the R and C grids are the same
    identical(gridR1,gridC1) & identical(gridR2,gridC2) & identical(gridR3,gridC3) & identical(gridR4,gridC4)

}


#####################################################################
## Show that the results from updating with C is equivalent to the ##
## results from updating in R.                                     ##
#####################################################################
testRandomResult =sapply(1:100,testRandomGrid)


#####################################################################
## Here is a function to test if the multistep grid function for C ##
## works.                                                          ##
#####################################################################
testRandomGridManySteps = function(seed) {

    ## generate a random grid
    set.seed(seed)
    numSteps = sample(1:1000,1)
    ## print(numSteps)

    dim = sample(2:100,2)
    size = prod(dim)
    numCars = sample(1:(size/2),2)
    
    grid = generateBMLgrid(dim[1],dim[2],numCars[1],numCars[2])

    ## update the grid manySteps
    gridUpdateC = updateManyStepsWithC(grid,numSteps)
    gridUpdateR = updateManySteps(grid,numSteps)


    ## check if the grids are the same
    identical(gridUpdateR,gridUpdateC)
}

testRandomGridManyStepsResult = sapply(1:100,testRandomGridManySteps)

##################
## do profiling ##
##################
Rprof("Rprof.out")
profileRandomGridManySteps = sapply(1:20,testRandomGridManySteps)
Rprof(NULL)
summaryRprof("Rprof.out")


    
    

