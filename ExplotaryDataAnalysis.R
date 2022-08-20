# Exploratory Data Analysis (EDA) is a key part of what we do when we analyze data. 
# We start out every analysis with EDA to familiarize ourselves with the data. 
# First, we want to check to see if some of the samples or experiments produce unusable data and 
# take them out of the analysis. 
# We also perform EDA at the end to check for nonsensical results. 
# In fact, one should perform EDA all throughout the analysis. 
# For example, before applying any of the techniques we have learned, 
# we want to make sure the data are in agreement with the necessary assumptions. 
# We will introduce some basic EDA tools such as histogram, the Q-Q plot, scatter plots, 
# boxplot, stratification, log transforms, and several summary statistics.


# Histogram
install.packages('UsingR')
library(UsingR)

x = father.son$fheight

round(sample(x,20),1)

# histogram
hist(x, breaks = seq(floor(min(x)), ceiling(max(x))),
     main="Height histogram", xlab = "Height in inches")

#xs
xs <- seq(floor(min(x)), ceiling(max(x)), 0.1)
plot(xs, ecdf(x)(xs), type ="l",
     xlab = "Height in inches", ylab = "F")

# QQ plot

mean(x>70)
1-pnorm(70, mean(x), sd(x))

#percentiles
ps <- seq(0.01, 0.99, 0.01)
ps
#quantiles
qs <- quantile(x,ps)
qs

normalqs <- qnorm(ps, mean(x), sd(x))
plot(normalqs, qs,
     xlab = "Normal Percentiles", ylab = "Height")
abline(0,1)

#qq functions -normal and line
qqnorm(x)
qqline(x)

# QQ-plot exercises
# positive skew decreasingly increasing
# negative skew increasingly increasing
load("skew.RData")

dim(dat)

par(mfrow = c(3,3))

x2 <- dat[,1]
View(x2)



for (i in 1:9) {
  qqnorm(dat[, i])
}


# Boxplot

hist(exec.pay)
qqnorm(exec.pay)
qqline(exec.pay)


# lower is Q1 (25%), higher line of rectangle is Q3 (75%) bold line is median
boxplot(exec.pay, ylab = "10.000s of dollars", ylim = c(0,400))


# Boxplot exercises

# The InsectSprays data set measures the counts of insects in agricultural experimental units 
# treated with different insecticides

head(InsectSprays)
View(InsectSprays)

boxplot(count ~ spray, data = InsectSprays)

data(nym.2002, package="UsingR")
View(nym.2002)

boxplot(time ~ gender, data = nym.2002)
# histogram
x1 <- filter(nym.2002, gender == "Male") 
hist(x1$time, col='blue')

x2 <- filter(nym.2002, gender == "Female") 
hist(x2$time, col='red', add=TRUE)








