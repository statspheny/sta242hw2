source("gridS4.R")

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


## Test to make sure it works
## set random seeds
## generate grid
