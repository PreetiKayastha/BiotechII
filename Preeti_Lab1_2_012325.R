# 01/21/2025

1+1
hello
"hello"
data = c(1,2,3)
data
View(data)
mydataframe <- data.frame(data)

mydataframe <- data.frame(
  name = c("preeti", "binju"),
  age = c(25, 28),
  height = c(5, 5.2),
  research = c("drosophila", "tomato")
)
mydataframe
View(mydataframe)
attach(mydataframe)
plot(age ~ height)
getwd()
install.packages("ggplot2")
library(ggplot2)
stupidcodes = c(1+1)
View(stupidcodes)
mystupidquotes <- data.frame( 
  Xaxis = c(11, 22, 33),
  yaxis = c(99, 88, 77)
  )
attach(mystupidquotes)
plot(mystupidquotes)

#01/23/2025

x <- 1
x<-1
x < -1
(x <- -1)
x
(y <- 2)
y <- 2
X == x
(X <- -1)
X!= x

x <- 1.0
(x <- x1.0)
x <- 1L
(x <- 1L)
(x  <- "one")
(x <- TRUE); (y <- FALSE)
x <- 1+1i
class(x)

a <- 2.5
class(a)
b <- 3L
class(b)

name <- "Preeti"
class(name)

vector <- c(1,2,3,4)
vector <- 1:4
matrix <- matrix(vector, nrow = 2, ncol = 2)

pkvector <- 1:7
pkvector
pkmatrix <- matrix(pkvector, nrow = 3, ncol = 4)
pkmatrix
pkdf <- data.frame(id = c("A","B","C","D","E","F","G"), values = pkvector)

num_vec <- numeric(7)
num_vec <- numeric(9)
num_vec
num_vec <- c(1,2,3,4,5,6)
num_vec
num_vec[7] <- 9
num_vec

cha_vec <- c("preeti", "kayastha")
cha_vec
cha_vec[c(2)]

names(num_vec) <- c("I","II","III","IV","V","VI","VII")
num_vec
num_vec[c("II","IV")]



pknumvec <- numeric(5)
pknumvec
pknumvec <- c(96,97,98,99,100)
pkchavec <- c("apple","banana","carrots","dates","eggs")
pkchavec
names(pknumvec) <- pkchavec
newpkvec <- pknumvec[c(1,3,5)]
newpkvec
anothervec <- names(newpkvec)
anothervec

(1+2)*(3+4)
9/7
9^3
pkeqn <- 2^(5*2)
pkeqn

leaf_area <- c(2.5,1.6,2.2,2.6)
Leaf_mass <- c(22, 15, 20, 24)
mean(leaf_area)
mean(Leaf_mass)
LMA <- Leaf_mass/leaf_area
LMA
mean(LMA)
