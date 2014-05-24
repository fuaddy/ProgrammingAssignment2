## Main goal of this codes are to cache the inverse of a matrix.
## makeCacheMatrix has two parts. In first part it sets the matrix and defines cache subfunction.
## in the second part get subfunction takes a matrix and stores it in m, the cache.

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
              setinverse = setinverse ,
              getinverse = getinverse )
 }

## This part calculates inverse of a matrix that was stored in the cache
## Firstli, it check whether cache something in it or not.
## if yes, it prints the "getting cached data" message and return the cached matrix
## if not, then it will get matrix and place it into data, and calculate the inverse and put to the cache.
## at last, it returs the value of m.

 cacheSolve <- function(x, ...) {
         m <- x$getinverse()
         if(!is.null(m)) {
                 message("getting cached data")
                 return(m)
         }
         
## Return a matrix that is the inverse of 'x'
	data <- x$get()
         m <- solve(data, ...)
         x$setinverse(m)
         m
 }



#then to check it
a <- makeCacheMatrix()
a$set(matrix(1:4,2,2))
a$get()
cacheSolve(a)

