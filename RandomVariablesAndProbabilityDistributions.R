install.packages('dplyr')
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

mean(treatment) - mean(control)

mean(control)
mean(treatment)

#random variable
population <- read.csv('femaleControlsPopulation.csv')
population <- unlist(population)
mean(sample(population,12))

mean(control)
mean(treatment)
