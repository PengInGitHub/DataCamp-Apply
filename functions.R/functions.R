#use functions in R
#https://www.datacamp.com/community/tutorials/functions-in-r-a-tutorial

#the first func
myFunc <- function(x){
  x*x
}

myFunc(5)
myFunc
#func with default value
myNewFunc <- function(x, y=2){
  x^y
}
myNewFunc(2,3)
myNewFunc(3,8)
myNewFunc(2)

#use return()
#use condition evaluation: if (missing(y)){y=seq(1,5,1)}
f <- function(x, y){
  if(missing(y)){
    y <- seq(1,5,1)
  }
  return(x^y)
}
f(2,3)
f(2)

#check input is within a list
ff <- function(x,y){
  if(missing(x)){x=2}#py: if !x {}
  if(missing(y)){y=2}
  if(!y %in% seq(2,8,2)){print("value must be within 2-8")}
  else return (x^y)
}

ff(2,2)
ff()
ff(3,1)
  
#anonymous function
#normal func
f <- function(x){return (x*10)}
f(10)
(function(x){return (x*10)})(10)  
  
  
  
  
  