# create a pair of rolling dice with a function and simulate the roll 

die <- 1:6 

# sampling more then one dice at the same time to simulate a  pair of rolling dice 

dice<- sample(die, size = 2, replace = TRUE)

sum(dice) # see what the sum of 2 dice are

# creating a function that will allow  me to roll the dice over and over again by calling the function only 

roll <- function(){
  die <- 1:6 
  dice <- sample(die, size =2, replace = TRUE)
  dice
  }

# Making the rolling of the dice work for any test value provided that we supply the argument for test 


roll2 <- function(test){
  die <- 1:6 
  dice <- sample(test, size =2, replace = TRUE)
  dice
}

# Now making some quickplots of the above function to ensure that the chances of random probablity sampling are all fair and equal - then will weight the dice in my favour 

library(ggplot2)

rolls <- replicate(10000,roll()) # > the number 7 seems to appear the most

qplot(rolls, binwdith =1) # > here we can see that it is certain that the sum of 2 dice equalling the number 7 appears the most frequently in the histogram

# the probability of every number coming up equally is currently 1/6th so a 1 in 6 chance of a number appearing however the sum that appears the most is 7 

# I will now weight the dice in order to bias it towards the number six with the probablity of 3/8


roll3 <- function(){
  die <- 1:6 
  dice <- sample(die, size =2, replace = TRUE, prob = c(1/6,1/6,1/6,1/6,1/6,3/8))
  sum(dice)
}

# Now by using replicate we will see that higher number sums will appear more often than lower ones this is due to the fact that the number 6 is appearing more often than not! 

replicate(50,roll3()) 

#plotting this we can now see using the long run in qplot >>> 

test3 <- replicate(100000, roll3())

qplot(test3, binwdith =1)


# This is only apparant in the long run > if a person was to run the roll3() function only once then it would appear as though the probabilities are equal - but they are not! A common number is now 7 which can be attributed to 6 + 1 = 7 



















