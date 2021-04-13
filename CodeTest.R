

p <- matrix(1:4,nrow=2,ncol=2)
q <- matrix(2:5,nrow=2,ncol=2)

aMatrix <- makeCacheMatrix(p) # initialize
aMatrix$get()                  # retrieve the value of x
aMatrix$getinverse()           # retrieve the value of m, which should be NULL as cacheSolve not called
cacheSolve(aMatrix)           # run to cache solution
cacheSolve(aMatrix)           # run to show that that cached solution is recognized
cacheSolve(aMatrix)           # run to show that that cached solution is recognized
aMatrix <- makeCacheMatrix(q) # re-initialize Matrix to remove cache
cacheSolve(aMatrix)           # run to show that cache has been removed by initialization
cacheSolve(aMatrix)           # run to show that that cached solution is recognized
cacheSolve(aMatrix)           # run to show that that cached solution is recognized



