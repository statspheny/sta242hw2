source("gridS4.R")


## Initial Test
par(mfrow=c(3,3))

set.seed(100)
x = generateBMLgrid(10,10,20,20)
plot(x)
print(bluecars(x))
print(redcars(x))

# Test if blue car moves
for(i in 1:4) {
    x=updateBlue(x)
    plot(x)
    print(bluecars(x))
    x=updateRed(x)
    plot(x)
    print(redcars(x))
}



## Test with different parameters
par(mfrow=c(1,1),mar=c(1,1,1,1))

set.seed(100)
x = generateBMLgrid(20,20,150,150)
plot(x)
print(bluecars(x))
print(redcars(x))

# Test if blue car moves
for(i in 1:20) {
    x=updateBlue(x)
    dev.hold()
    Sys.sleep(1)
    frame()
    plot(x)
    dev.flush()
    ##print(bluecars(x))
    print(x@bluevel)
    
    x=updateRed(x)
    dev.hold()
    Sys.sleep(1)
    frame()
    plot(x)
    dev.flush()
    print(x@redvel)
    
    ##print(redcars(x))
}



source("gridS4.R")
set.seed(100)
x = generateBMLgrid(20,20,10,10)

## Test to make sure it works
## set random seeds
## generate grid
