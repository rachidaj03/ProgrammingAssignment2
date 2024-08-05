
'/* The function makeCacheMatrix takes the matrix and 
stores it using a list of functions get,set,get inverse, set inverse
that was inspired using the example of storing the mean 
/*'

makeCacheMatrix <- function(x = matrix()) {
inv<- NULL
set<-function(y){
	x<<-y
	inv<<-NULL
}
get<-function(){
	x
}
setInv<-function(inverse){
	inv<<-inverse
}
getInv<-function(){
	inv
}
list(set=set,get=get,setInv=setInv,getInv=getInv)
}
'/* The function cacheSolve takes the same unchanged matrix and takes
its inverse using the list of the function above get inverse and if
the inverse is null aka not calculated before it inverses the matrix otherwise it only returns the value
/*'

cacheSolve <- function(x, ...) {
       inv<-x$getInv()
       if(!is.null(inv)){
       	message("Matrix inverse restored")
       	return(inv)
       }
       mat<-x$get()
       inv<-solve(mat,...)
       x$setInv(inv)
       return(inv)
}
