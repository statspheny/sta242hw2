#source("gridS4.R")
library(schanBMLgrid)

## Initial Test
par(mfrow=c(3,3))

set.seed(100)
x = generateBMLgrid(20,20,10,10)
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
par(mfrow=c(1,1))

set.seed(100)
x = generateBMLgrid(20,20,10,10)
plot(x)
print(bluecars(x))
print(redcars(x))

# Test if blue car moves
for(i in 1:5) {
    x=updateBlue(x)
    dev.hold()
    Sys.sleep(1)
    frame()
    plot(x,main=paste("step",i))
#    plot(x)
    dev.flush()
    print(bluecars(x))
    
    
    x=updateRed(x)
    dev.hold()
    Sys.sleep(1)
    frame()
    plot(x,main=paste("step i"))
#    plot(x)
    dev.flush()
    
    print(redcars(x))
}



set.seed(100)
y = generateBMLgrid(20,20,10,10)
print(redcars(y))
print(bluecars(y))

y = updateManySteps(y,10)
print(redcars(y))
print(bluecars(y))

y = updateManySteps(y,20,video=TRUE)

## do timing and profiling

Rprof("Rprof.out")
set.seed(100)
y = generateBMLgrid(100,100,200,200)
y = updateManySteps(y,100)
Rprof(NULL)
summaryRprof("Rprof.out")

## check to get the velocity of increasing the cars
getAverageFinalVelocity = function(BMLobj) {
    obj1 = updateBlue(BMLobj)
    blueVel = getVelocity(bluecars(BMLobj),bluecars(obj1))
    obj2 = updateRed(BMLobj)
    redVel = getVelocity(redcars(BMLobj),redcars(BMLobj))
    mean(blueVel,redVel)
}

## see what happens to the velocity as the traffic grid gets fuller
set.seed(100)
## create a set of grids of varying fullness
rho = 1:10*0.1
gridsize = 100
diffrhogrids = lapply(rho, function(x) generateBMLgrid(gridsize,gridsize,x*gridsize^2/2,x*gridsize^2/2))

## create a function to record the velocity as time changes
velocityOverTime = function(obj,deltatimes) {

    output = numeric(length(deltatimes))
    for (i in 1:length(deltatimes)) {
        obj = updateManySteps(obj,deltatimes[i])
        output[i] = getAverageFinalVelocity(obj)
    }

    output
}

## Get all the average velocities
averageVelocities = sapply(diffrhogrids,velocityOverTime,deltatimes = rep(10,50))

## plot the changed velocities
library(lattice)
times = rep(1:50*10,10)
rho = rep(1:10*0.1,each=50)
pdf("velocity.pdf")
xyplot(averageVelocities~times|as.factor(rho),groups=rho,main="Average Velocity for Grid Densities")
dev.off()
