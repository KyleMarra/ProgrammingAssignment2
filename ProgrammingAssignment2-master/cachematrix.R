## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL #sets empty matrix
  
  #refreshes the cache with input of new matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  #get "gets" the new matrix
  get <- function() x
  
  # this will be called by cache solve
  setinverse <- function(inverse) m <<- inverse
  
  #this retreive a stored matrix
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function

function(x, ...) {
  #retreives a matrix that is the inverse matrix
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

