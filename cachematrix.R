## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL                       #This is the variable going to cache the result of execute solve()
	set <- function(y){             
	                                ##This is the function to set a new matrix 
		x <<- y			##This will pass the y value to the x of function in the one level up environment 
		s <- NULL
	}
	
	get <- function() x             ##This is the function to get the current matrix accepted
	
	setsolve <- function(solveresult) s <<- solveresult             ##This the function to pass the result of solve() to the s viriable(which has benn initiated before)
	
	getsolve <- function() s       ##This is the function to get the stored result of solve() 
	
	list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)  ##list all functions here
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()                                       ##at first we need test if the s has been cached
	if(!is.null(s)){                                        ##if it has benn cached, we should pop out the message and return the stored value
		message("getting cached matrix")
		return(s)
	}
	
	data <- x$get()                                         ##if s hasn't been cached we should calculate it, and we should extract the matrix first
	s <- solve(data, ...)                                   ##exect the solve() function, ... is passed from the ... of cacheSovle(the one level up function)
	x$setsolve(s)                                           ## pass the solve() result and cache it with the function defined in the makeCacheMatrix
	s                                                       ## THis function take s as a return value
}
