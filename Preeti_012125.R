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
