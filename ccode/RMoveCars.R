dyn.load("RMoveCars.so")
is.loaded("RupdateBlueCarsCRoutine")

## function to updateBlue using C function
updateBlueWithC = function(obj) {
    ## get values
    dim = getdim(obj)
    objblue = as.integer(bluecars(obj))
    objred = as.integer(redcars(obj))
    numBlue = length(objblue)
    numRed = length(objred)

    ## call C
    newBluecars = .C("RupdateBlueCarsCRoutine",
      dim[1],
      dim[2],
      numBlue,
      objblue,
      numRed,
      objred,
      ans = integer(numBlue))$ans

    ## # for debugging purposes
    ## print("oldblue")
    ## print(objblue)
    ## print("newblue")
    ## print(newBluecars)

    ## update object
    obj@bluecars = newBluecars

    return(obj)
}


## function to updateRed using C function
updateRedWithC = function(obj) {
    ## get values
    dim = getdim(obj)
    objblue = as.integer(bluecars(obj))
    objred = as.integer(redcars(obj))
    numBlue = length(objblue)
    numRed = length(objred)

    ## call C
    newRedcars = .C("RupdateRedCarsCRoutine",
      dim[1],
      dim[2],
      numBlue,
      objblue,
      numRed,
      objred,
      ans = integer(numRed))$ans

    ## # for debugging purposes
    ## print("oldred")
    ## print(objred)
    ## print("newred")
    ## print(newRedcars)

    ## update object
    obj@redcars = newRedcars

    return(obj)
}


## function to updateManySteps using C function
updateManyStepsWithC = function(obj,numSteps) {
    ## get values
    dim = getdim(obj)
    objblue = as.integer(bluecars(obj))
    objred = as.integer(redcars(obj))
    numBlue = length(objblue)
    numRed = length(objred)

    ## update with C
    updatedObj = .C("RupdateManyStepsCRoutine",
      dim[1], dim[2],
      numBlue, objblue,
      numRed, objred,
      numSteps,
      newBlue = integer(numBlue),
      newRed = integer(numRed))

    newBlue = updatedObj[['newBlue']]
    newRed = updatedObj[['newRed']]

    ## update object
    obj@bluecars = newBlue
    obj@redcars = newRed
      
