install.packages('dplyr')
library(dplyr)

# lecture
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

# For these exercises, we will use a new dataset related to mammalian sleep.
library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

#1 Read in the msleep_ggplot2.csv file with the function read.csv() and 
#  use the function class() to determine what type of object is returned.

dat_ex <- read.csv('msleep_ggplot2.csv')
View(dat_ex)
class(dat_ex)


#2 Now use the filter() function to select only the primates.
#  How many animals in the table are primates?

primates <- filter(dat_ex, order=="Primates")
nrow(primates)

#3 What is the class of the object you obtain 
#  after subsetting the table to only include primates?

class(primates)

#4 Now use the select() function to extract the sleep (total) for the primates.
primates_sleep_total <- filter(dat_ex, order=="Primates") %>% 
  select(sleep_total)
class(primates_sleep_total)

#5 Now we want to calculate the average amount of sleep for primates 
#(the average of the numbers computed above). One challenge is that 
#the mean() function requires a vector so, if we simply apply it to the output above,
#we get an error. Look at the help file for unlist() and 
#use it to compute the desired average.
#What is the average amount of sleep for primates?

primates_sleep_total <- filter(dat_ex, order=="Primates") %>% 
  select(sleep_total) %>% 
  unlist

mean(primates_sleep_total)

#6For the last exercise, we could also use the dplyr summarize() function. 
# We have not introduced this function, but you can read the help file and 
# repeat exercise 5, this time using just filter() and summarize() to get the answer.
# What is the average amount of sleep for primates calculated by summarize()

primates_sleep_total <- filter(dat_ex, order=="Primates") %>%
summarize(mean = mean(sleep_total))

primates_sleep_total

