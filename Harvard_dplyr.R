install.packages('dplyr')
library(dplyr)


dat <- read.csv('femaleMiceWeights.csv')
View(dat)

#chow diet mice filtering
control_mice <- filter(dat, Diet =="chow")
View(control_mice)

#select bodyweight of the control mice
control_mice <-select(control_mice, Bodyweight)
unlist(control_mice)


# piping all the functions in one line
control_mice <- filter(dat, Diet == "chow") %>% 
  select(Bodyweight) %>% 
  unlist

control_mice
mean(control_mice)
