par(mfrow=c(2,2))
x = generateBMLgrid(10,10,.5)
plot(x)

# Test if blue car moves
for(i in 1:3) {
    x=updateBlueCar(x)
    plot(x)
    print(x$blue)
}


