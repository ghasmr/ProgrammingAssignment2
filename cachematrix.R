## Put comments here that give an overall description of what your
## functions do

## As the example of R programming course, I defined the "makeCacheMatrix "
## to give us a list of four functions. 

## Write a short comment describing this function


## Regarding to one of the threads(2) , the following line 
##(i <- NULL), is necessary because it restarts the value of "i" (inverse of the matrix). 
## The following four functions make an environment, which "cacheSolve"
##can access to "i" and "x" (the matrix) only through them(3).

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
setmatrix <- function(y) {
x <<- y 
i <<- NULL}
getmatrix <- function() x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list(setmatrix = setmatrix, getmatrix = getmatrix,
setinverse = setinverse,
getinverse = getinverse)}
}


## Write a short comment describing this function
## "cacheSolve" uses the above functions to calculate the inverse of the matrix
## which is given to it by this command: "data <- x$getmatrix()" .
## Once the inverse is calculated, the matrix will be cached.
## Upon the second calling of the same matrix, calculation would stops by this command "return(i)". 
##And the inverse returns. Otherwise "cacheSolve" calculates the inverse of a new matrix. 

cacheSolve <- function(x, ...) {

  i <- x$getinverse()
if(!is.null(i)) {
message("getting cached data")
return(i)}
data <- x$getmatrix()
i <- solve(data, ...)
 x$setinverse(i)
i
}

##References:
#1- The example of R programming course for this assignment:https://class.coursera.org/rprog-010/human_grading/view/courses/973491/assessments/3/submissions.
#2- https://class.coursera.org/rprog-010/forum/thread?thread_id=726
#3- https://class.coursera.org/rprog-010/forum/thread?thread_id=364
