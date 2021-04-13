## Computation of the inverse of a matrix can be very intensive
## These functions allow the results of the inverse of a matrix to be cached
## and thereby avoid the need for computation unless the matrix is given values afresh.

## This function, makeCacheMatrix creates a special matrix which has a list contain functions to set and get the values of
## the matrix and get and set the values of the inverse of the matrix.


makeCacheMatrix <- function(x = matrix()) { 
      m <- NULL
      set <- function(y) {
      x <<- y
      m <<- NULL
}
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)

}


## This function takes the special Matrix computed from MakeCacheMatrix as its input and checks whether the 
## inverse has already been calculated for the matrix passed to it.  If the inverse has already been calculated,
## it takes the cached inverse and skips the computation.  Otherwise, it takes the new matrix, calculates its inverse
## and sets the value of the inverse in the cache in preparation for the matrix if it is reused.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}
