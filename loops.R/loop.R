#R loop exercise
#https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r#comments
##### for loop #####
#Plain loop
u1 = rnorm(30)
print (u1)
#usq = 0
#language comparsion
#condition in Parentheses: java, R; not in: Go, py
#block in curly brackets: java, R, Go; not in: py
for (i in 1:10){
  #usq is not necessarily initialized
  usq[i] = u1[i]*u1[i]
  print(usq[i])
}
print(usq)

#Nested loop
ma = matrix(nrow=30, ncol=30)
#row
for (i in 1:dim(ma)[1]){
  print (i)
  #col
  for (j in 1:dim(ma)[2]){
    print(j)
    ma[i,j] = i*j
  }
}
ma[1:6, 1:6]

#create a 3d array in a nesed loop
a = array(1:20, dim=c(20,20,20))
#x
for (i in 1:dim(a)[1]){
  #y
  for (j in 1:dim(a)[2]){
    #z
    for (k in 1:dim(a)[3]){
      a[i,j,k] = i*j*k
    }
  }
}
#add int t to prevent the user printing too large table
my_int = 2
n = as.integer(my_int)
if (n > 10){
  print(a[1:10,1:10,1:10])
}else{
  print(a[1:n,1:n,1:n])
}


##### while loop #####

# Your User Defined Function
#a user defined func to get the user input
readInteger <- function(){
  n <- readline(prompt = "please input the answer: ")
}

#made mistake here, readInteger(), forgot the ()
response <- as.integer(readInteger())

while (response!=3){
  print("wrong answer, the input must be 3")
  response <- as.integer(readInteger())
}

##### repeat loop #####
#usage: repeat break
repeat{
  response <- as.integer(readInteger())
  
  if (response == 42){
    print('Good job!')
    break
  }else{
    print('the answer has to be 42')
    
  }
}

##### break #####
#In the case of nested loops,
#the break will permit to exit only from the innermost loop.
#matrix(data, nrow, ncol)
m = 10
n = 10
my_matrix = matrix(0, m, n)

for (x in 1:dim(my_matrix)[1]){
  for (y in 1:dim(my_matrix)[2]){
    if(x==y){
      break
    }else{
      my_matrix[x,y] = x*y
    }
  }
}
print(my_matrix)

##### next #####
#discontinues a particular iteration and jumps to the next cycle
#jumps to the evaluation of condition holding the current loop
#aka continue in other language

for (k in 1:20){
  if (k%%2){#if reminder is not zero
    next#jump to the condition evaluation part (k in 1:20)
  }
  print(k)# would be ignored if k%%2 is not zero
}


##### alternative to loop: apply #####

#addition of two vectors
a = c(4, 6, 2, 3)
b = c(1, 5, 6, 7)

#in a loop: element by element
for (i in 1:length(a)){
  c[i] = a[i]+b[i]
}

#vectorized form: native
#add vectors
c = a + b #different from py in terms of '+'
#add matrices
a = matrix(1:6, nrow=3, ncol=2)
b = cbind(c(1,2,5), c(2,5,3))
c = a + b
c
#vectorization run faster
#create matrix
m = 10
n = 10
#rnorm(n,mean=0,std=0): n numbers that have mean=0 std=0
#replicate(A,B): replicate B for A times. B:nrow, A:ncol
my_matrix = replicate(m,rnorm(n))
my_df = data.frame((my_matrix))

#update value

#use a loop
#it takes time to copy and manage the data

system.time(for (x in 1:m){
  for (y in 1:n){
    my_df[x, y] = my_df[x, y] + 10*sin(0.75*pi)
  }
}) #0.023

#use verctorization
my_df = data.frame(my_matrix)
system.time(my_df <- my_df + sin(0.75*pi)*10)#0.001

##### apply #####
#rep(seq(5),4) repeat 1 2 ... 5 for 4 times
#matrix(data, nrow=, ncol=)
mymat <- matrix(rep(seq(5),4),ncol=5)
apply(mymat, 1, sum)#each row
apply(mymat, 2, mean)#each col
#UDF
apply(mymat, 1, function(x, y) sum(x)+y, y=4.5)
apply(mymat, 2, function(x) summary(x))






















