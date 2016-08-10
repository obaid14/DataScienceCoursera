# The two functions here makeCacheMatrix, is used to initialize the matrix
# in the global environment and the second function cacheSolve calculates
# the inverse and also if the inverse is already present, then it retrieves
# it from the cache.

## This function initializes the matrix with the getters and setters.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinvert <- function(solve) m <<- solve
    getinvert <- function() m
    list(set = set, get = get,
         setinvert = setinvert,
         getinvert = getinvert)

}

## This function calculates the inverse of the matrix, if its a new matrix
## Otherwise, it gets the cached data and displays the result.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinvert()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinvert(m)
    m
}
