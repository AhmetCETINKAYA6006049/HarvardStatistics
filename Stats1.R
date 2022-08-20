1+1

version

x <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
mean(x)

tot <- 0
tot

for( i in 1:25) {
  tot <- tot + i*i
}
tot

data(cars)
cars
class(cars)

nrow(cars)

colnames(cars)

df <- data.frame(cars)
mean(df[,2])

which(cars[2] == 85)

install.packages("downloader")
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download(url, destfile=filename)


df <- read.csv('femaleMiceWeights.csv')
df
colnames(df)
df[12,2]
df$Bodyweight[11]
length(df$Diet)


nums <- 3:7
nums

cnt <- 0
tot <- 0

for( i in 1:24) {
  if(df$Diet[i] == 'hf') {
    cnt = cnt + 1
    tot = tot + df$Bodyweight[i]
  }
}

average <- tot / cnt

average

set.seed(1)
?sample
vec <- 13:24
sample(vec, 1)
df$Bodyweight[sample(vec, 1)]

