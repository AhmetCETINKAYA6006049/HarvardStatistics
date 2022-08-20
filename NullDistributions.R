library(dplyr)

# lecture
dat <- read.csv('femaleMiceWeights.csv')
View(dat)

#control mice
control <- filter(dat, Diet == "chow") %>% 
  dplyr::select(Bodyweight) %>% 
  unlist

#treatment mice
treatment <- filter(dat, Diet == "hf") %>% 
  dplyr::select(Bodyweight) %>% 
  unlist

mean(control)
mean(treatment)

mean(treatment) - mean(control)

obs <- mean(treatment) - mean(control)
obs

# p value 
# is this 3.02g difference is by chance 
# let's test it statically

population <- read.csv('femaleControlsPopulation.csv')
population <- unlist(population)

n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n) {
  control <- sample(population,12)
  treatment <- sample(population,12)
  nulls[i] <- mean(treatment) - mean(control)
}

hist(nulls)
# if mean of nulls > mean of observations our hypothesis is true 
# p is 0.0272 > 0.001
mean(nulls > obs) 
mean(abs(nulls) > obs)



# Exercises

#Here x represents the weights for the entire population.
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )


#1 Set the seed at 1, then using a for-loop take a random sample of 5 mice 1,000 times. 
#Save these averages.
#What proportion of these 1,000 averages are more than 1 gram away from the average of x ?

set.seed(1)


n <- 1000
avgs <- vector("numeric", n)
distance <- 0
yes <- 0
for(i in 1:n) {
  samps <- sample(x,5)
  avgs[i] <- mean(samps)
  
}
hist(avgs)

mean(abs(avgs - mean(x)) > 1)


#2 We are now going to increase the number of times we redo the sample from 1,000 to 10,000. 
#Set the seed at 1, then using a for-loop take a random sample of 5 mice 10,000 times. 
#Save these averages.
#What proportion of these 10,000 averages are more than 1 gram away from the average of x ?

set.seed(1)


n <- 10000
avgs <- vector("numeric", n)
distance <- 0
yes <- 0
for(i in 1:n) {
  samps <- sample(x,5)
  avgs[i] <- mean(samps)
  
}
hist(avgs)

mean(abs(avgs - mean(x)) > 1)
