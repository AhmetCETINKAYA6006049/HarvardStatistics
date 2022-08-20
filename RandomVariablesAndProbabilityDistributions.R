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



#Exercises
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
x

RNGkind("Mersenne-Twister", "Inversion", "Rejection")

#1 What is the average of these weights?
mean(x)

# Take a random sample of size 5.
# What is the absolute value (use abs()) of the difference 
# between the average of the sample and the average of all the values?

set.seed(1)

ms <- mean(sample(x,5))
ms
mx <- mean(x)
mx
diff <- ms - mx
diff
abs(diff)

#3 After setting the seed at 5, set.seed(5), take a random sample of size 5. 
#  What is the absolute value of the difference between the average of the sample and 
#  the average of all the values?

set.seed(5)

ms <- mean(sample(x,5))
ms
mx <- mean(x)
mx
diff <- ms - mx
diff
abs(diff)
