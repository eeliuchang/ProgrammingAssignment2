
## makeCacheMatrix creates a special "matrix" object that can cache its inverse. It contains functions set(),get(),setInverse(), getInverse().

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setInverse <- function(matrixInverse) m <<- matrixInverse
	getInverse <- function() m
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## casheSolve computes the inverse of the special "matrix" returned by makeCacheMatix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getInverse
        if(!is.null(m)){
        	message("getting cached data")
        	return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setInverse(m)
        m
}
