# 01/28/2025
#Week3

##making a dataframe_by loading from csv
setwd("C:/Users/Student/Desktop/2nd semester/Biotech II")
getwd()
mydataframe <- read.csv("day3GL.csv")
print(mydataframe)
summary(mydataframe)

##making a dataframe_by creating in R
my_df <- data.frame (
  ID = c(1:6),
  Glucose = c(1.0, 1.6, 1.3, 1.5, 1.7, 1.9 ),
  TG = c(2.2, 2.3, 2.4, 2.3, 2.2, 2.8)
)
print (my_df)
summary(my_df)

##viewing the dataframe
my_df[2]
my_df[,2]
my_df[2,]
my_df$Glucose
my_df$TG
my_df[2,3]
my_df[2:3,1:2]
my_df [2:3,1:2]

##Activity_ Creating my own dataframe
vector <- c("Preeti", "Shristi", "Sumitra", "Kebal", "Aashish")
my_people <- data.frame(
  name = c("Preeti", "Shristi", "Sumitra", "Kebal", "Aashish"),
  age = c(26,31,60,70,35),
  gender = c("Female", "Female", "Female", "Male", "Male"),
  act = c(10, 60, 30, 0, 0)
)
view
summary(my_people)
mean(my_people$age)
mean(my_people$act)
min(my_people$age)
max(my_people$act)

##Conditional statements

###using == for equivalence
num1 <- 4
num2 <- 5
num1 == num2
num2 <- 4
num1 == num2

###using <, >, <=, >=
num2 <- 5
num1 < num2

###using ! or whether the statement isn’t true
!(num1 < num2)
num1 != num2

###using & (and) and | (or)
var1 <- 1
var2 <- "red"
(var1==1) & (var2=="red")
(var1==1) & (var2=="green")
(var1==1) | (var2=="red")
(var1==1) | (var2=="green")

##If-else statements
if (num1 == num2)
{
  print ("num1 equals num2")
} else
{
  print ("num1 does not equal num2")
}

##Creatingfunction
my_function <- function ()
{
  print ("Hello World!")
}
my_function()

##return in function

###without using return
my_function <- function(x, y) {
  val <- x + y
}
my_function(1,2)

###using return
my_function2 <- function(x, y) {
  val <- x + y
  return(val)
}
my_function2(1,2)

##Activity - Decoding a function
my_function <- function(x,y) {
  if (x>y)
  {
    val <- x^2
    return(val)
  } else
  {
    val <- y^3
    return(val)
  }
}
my_function(1)
my_function(1,2)

##making a function
pk_function <- function(x){
  randominteger <- sample(1:5,1)
  if(x == randominteger)
  { print("These values are the same!")}
  else
  {print(randominteger)
    print("These two numbers are not the same")
  }
}
pk_function(1)

##make my own function 1
myownfunction <- function(x){
  result <- x*x
  return(result)
}
myownfunction(2)

##make my own function 2
myownfunction3 <- function(score)
{
  if(score>89)
  {print("A") }
  else if (score >= 80)
  {print("B")}
  else if (score >= 70)
  {print("C")}
  else if (score >= 60)
  {print ("D")}
  else if (score <60)
  {print ("F")}
}
myownfunction3(95)

##an example of how the code won't return, don't forget return
myownfunction2 <- function(y)
{
  result <- y+2
}
myownfunction2(4)




#01/30/2025

##checking my dataframe
data("trees")
summary(trees)
head (trees)
tail(trees)
class (trees)
str(trees)
dim(trees)
names(trees)

##transforming my data using dplyr package
install.packages("dplyr")
library("dplyr")
?filter
?arrange
filter(trees, Height < 75)
filter(trees, Volume == 10.0)
filter(trees, Volume == 10.3)

arrange(trees, Girth)

select(trees, Height)

###adding new column by using the existing column
mutate(trees, as_ratio = Girth/Volume)

summarize (trees,
          mean_volume = mean(Volume))
summarize (trees, 
          mean_volume = mean(Volume),
          sd_volume = sd(Volume))

trees %>%
  mutate(as_ratio = Girth/Volume) %>%
  filter(Volume > 40) %>%
  summarise(mean_height = mean(Height),
            mean_volume = mean(Volume))

trees %>%
  group_by(Girth) %>%
  summarise((mean_height = mean(Height)))


###Activity using dplyr package
install.packages("nycflights13")
library(nycflights13)
data("flights")
View(flights)
filter(flights, month == 7 | month == 8 | month ==9)
arrange(flights, dep_delay)
arrange(flights, desc(dep_delay))
select (flights, month, day, dep_time)
mutate(flights, speed_of_each_flight = distance / air_time * 60)
delays <-flights %>%
group_by(origin) %>%
  summarise(
    delay = mean (arr_delay, na.rm = TRUE)
  )

###Activity of processing my own data using dplyr
vector <- c("Preeti", "Shristi", "Sumitra", "Kebal", "Aashish")
my_people <- data.frame(
  name = c("Preeti", "Shristi", "Sumitra", "Kebal", "Aashish"),
  age = c(26,31,60,70,35),
  gender = c("Female", "Female", "Female", "Male", "Male"),
  act = c(10, 60, 30, 0, 0)
)
##$ for accessing_that column
plot(my_people$age, my_people$act)

###label the plots: improving
?pch
plot(my_people$age, my_people$act,
     xlab = "age",
     ylab = "act",
     main = "age vs act",     
     pch = ifelse(my_people$name == "Preeti", 19, 15),     
     col = ifelse(my_people$name == "Preeti", "pink", "blue"))  
legend("topright", c("Preeti", "Others"),        
       col = c("pink", "blue"),        
       pch = c(19, 15))

###making my own dataframe and plotting
mydataframe3 <- read.csv("2nd01_30_2025.csv")
print(mydataframe3)
plot(mydataframe3$Day1, mydataframe3$Day3,
     xlab = "Day1",
     ylab = "Day3",
     main = "Day1 vs Day3",
     pch = ifelse(mydataframe3$Replicate == "C1", 19, 15),     
     col = ifelse(mydataframe3$Replicate == "C1", "pink", "blue"))  
legend("topright", c("C1", "Others"),        
       col = c("pink", "blue"),        
       pch = c(19, 15))



#02/04/2025

data("mtcars")
force(mtcars)

##only scatterplot
plot(mtcars$mpg, mtcars$disp,
     xlab = "mpg",
     ylab = "disp",
     main = "disp~mpg")

##scatterplotwithasmoothline
scatter.smooth(x=mtcars$mpg, y=mtcars$disp, main = "disp ~ mpg")

##Correlation test
cor.test(mtcars$mpg, mtcars$disp)
cor_result <- cor.test(mtcars$mpg, mtcars$disp)
cor_result$data.name
cor_result$p.value
cor_result$estimate
install.packages("corrplot")
library(corrplot)
corrplot(cor(mtcars))
class(mtcars)
structure(mtcars)

###activity I: Correlation test
data("ChickWeight")
force(ChickWeight)
scatter.smooth(x=ChickWeight$weight, y=ChickWeight$Time, main = "weight ~ Time")
##select is a function of dplyr package
CW <- select(ChickWeight, Time, weight)
corrplot(cor(CW))

###activity II: Correlation test
data("attenu")
Att <- select(attenu, event, mag, dist, accel)
corrplot(cor(Att))
scatter.smooth(x=attenu$mag, y=attenu$dist, main = "mag ~ dist")
cor.test(attenu$mag, attenu$dist)
cor_result <- cor.test(attenu$mag, attenu$dist)
cor_result$data.name
cor_result$p.value
cor_result$estimate

##ttest
data("sleep")
t.test( extra ~ group, data = sleep)
## this is when one is numeric, one is factor
##test mean vs 5
t.test(trees$Girth, mu = 5)

###conducting ttest with my own dataframe
ttestdf <- data.frame( 
flyweight = c(1, 2, 1, 2, 3, 1, 2, 3, 4, 1),
flyglucose = c( 9, 8, 6, 5, 4, 3, 7, 7, 6, 5)
)
ttestresult <- t.test(ttestdf$flyweight, ttestdf$flyglucose)
print(ttestresult)
ttestresult$p.value

##Anova
res_aov <- aov( weight ~ group, data = PlantGrowth)
summary(res_aov)
TukeyHSD(res_aov)

###performing anova with my own dataframe
anova<- data.frame( 
  flyweight = c(1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3),
  flyglucose = c( 9, 8, 6, 5, 4, 3, 7, 7, 6, 5, 4, 5),
  condition = c( "Control",  "Control",  "Control",  "Control", "Capsaicin", "Capsaicin", "Capsaicin", "Capsaicin", "Capsiate", "Capsiate", "Capsiate", "Capsiate")
)
res_aov2<- aov( flyweight ~ condition, data = anova)
summary(res_aov2)
TukeyHSD(res_aov2)

######OR

anova2 <- data.frame( 
  flyweight = c(1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3),
  flyglucose = c( 9, 8, 6, 5, 4, 3, 7, 7, 6, 5, 4, 5),
  condition = rep(c("Condion", "Capsaicin", "Capsiate"), each = 4)
)
####rep: function that repeats the elements for each time)
res_aov3<- aov( flyweight ~ condition, data = anova)
summary(res_aov3)
TukeyHSD(res_aov3)


## simple linear regression
linear_mod <- lm(dist ~ speed, data=cars)
summary(linear_mod)

##Multiple linear regression
linear_mod2 <- lm(mpg ~ disp + qsec, data=mtcars)
summary (linear_mod2)

###activity:Simple Statistics

data("attenu")

#Is there a correlation between moment magnitude(mag) and  Station-hypocenter distance(dist)???
Att <- select(attenu, event, mag, dist, accel)
corrplot(cor(Att))

scatter.smooth(x=attenu$mag, y=attenu$dist, main = "mag ~ dist")
cor.test(attenu$mag, attenu$dist)
cor_result <- cor.test(attenu$mag, attenu$dist)
cor_result$data.name
cor_result$p.value
cor_result$estimate
