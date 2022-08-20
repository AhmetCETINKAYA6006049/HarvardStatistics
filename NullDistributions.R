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













