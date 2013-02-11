source("RMoveCars.R")

library(schanBMLgrid)

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
      

