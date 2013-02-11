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

    # for debugging purposes
    print("oldblue")
    print(objblue)
    print("newblue")
    print(newBluecars)

    obj@bluecars = newBluecars

    return(obj)
}


updateRedWithC = function(obj) {
    dim = getdim(obj)
    objblue = as.integer(bluecars(obj))
    objred = as.integer(redcars(obj))
    numBlue = length(objblue)
    numRed = length(objred)

    newRedcars = .C("RupdateRedCarsCRoutine",
      dim[1],
      dim[2],
      numBlue,
      objblue,
      numRed,
      objred,
      ans = integer(numRed))$ans

    # for debugging purposes
    print("oldred")
    print(objred)
    print("newred")
    print(newRedcars)

    obj@redcars = newRedcars

    return(obj)
}
