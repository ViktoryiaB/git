## The following two functions create a special object to store the matrix and to cache the inverse of it.

## makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

	inv <- NULL
	set <- function(z){
	x <<- z
	inv <<- NULL
	}

	get <- function() x
	setinv <- function(inverse) inv <<- inverse
	getinv <- function() inv
	list( set = set, get = get,
		setinv = setinv,getinv = getinv)
}

## This function calculates the inverse of the matrix returned by makeCacheMatrix. An assumption made here is that a matrix is always invertable.
If the inverse has already been computed and there are no changes in the matrix, the function retrieves that result and skips the computation. 
In case the inverse was not computed previously, the computation of the inverse is performed.

cacheSolve <- function(x, ...) {
	inv <- x$getinv()
		if(!is.null(inv)) {
		message("cache")
		return(inv)
	}

	internalData <- x$get()
	inv <- solve(internalData)
	x$setinv(inv)
	inv
}
		
	
        ## Return a matrix that is the inverse of 'x'
}
