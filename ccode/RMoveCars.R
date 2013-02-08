dyn.load("RMoveCars.so")
is.loaded("RupdateBlueCarsCRoutine")

updateBlueWithC = function(obj) {
    dim = getdim(obj)
    objblue = bluecars(obj)
    objred = redcars(obj)
    numBlue = length(objblue)
    numRed = length(objred)
    newBluecars = numeric(numBlue)
    
    newBluecars = .C("RupdateBlueCarsCRoutine",
      dim[1],
      dim[2],
      numBlue,
      objblue,
      numRed,
      objred,
      ans = newBluecars)$ans

    print(objblue)
    print(newBluecars)

    obj@bluecars = newBluecars

    return(obj)
}

