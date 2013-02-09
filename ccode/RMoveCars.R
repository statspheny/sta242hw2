dyn.load("RMoveCars.so")
is.loaded("RupdateBlueCarsCRoutine")

updateBlueWithC = function(obj) {
    dim = getdim(obj)
    objblue = as.integer(bluecars(obj))
    objred = as.integer(redcars(obj))
    numBlue = length(objblue)
    numRed = length(objred)
    #newBluecars = integer(numBlue)
    
    newBluecars = .C("RupdateBlueCarsCRoutine",
      dim[1],
      dim[2],
      numBlue,
      objblue,
      numRed,
      objred,
      ans = integer(numBlue))$ans

    print("oldblue")
    print(objblue)
    print("newblue")
    print(newBluecars)

    #obj@bluecars = newBluecars

    return(obj)
}

