install.packages("psych")
install.packages("MASS")

library(psych)
library(MASS)

setwd("C:/RWork/NAPS")
getwd()

# mdl <- read.csv (file="mdl_urban_nonpolar.csv",head=TRUE,sep=",")
load("mdl_urban_nonpolar.Rda")
mdl$date <- as.Date(mdl$date)

# Basic structure
head(mdl)
summary(mdl)
str(mdl)

# Basic plots
plot(mdl$date, mdl$XBenzene)
hist(mdl$XBenzene,
     main="Distribution od detection limit for Benzene (2003-11-10 - 2014-04-01)",
     xlab="µg/m3")
boxplot(mdl$XBenzene)
qqnorm(mdl$XBenzene); qqline(mdl$XBenzene)

plot(mdl$date, mdl$XToluene)
hist(mdl$XToluene,
     main="Distribution od detection limit for Toluene (2003-11-10 - 2014-04-01)",
     xlab="µg/m3")
boxplot(mdl$XToluene)
qqnorm(mdl$XToluene); qqline(mdl$XToluene)

# Kernal density plot Benzene
d <- density(mdl$XBenzene) # returns the density data 
plot(d, main="Kernel Density plot of replicate\nlow level measurements\nBenzene 2004-2014"); polygon(d, col="red", border="blue")

# Kernal density plot Toluene
d <- density(mdl$XToluene) # returns the density data 
plot(d, main="Kernel Density plot of replicate\nlow level measurements\nBenzene 2004-2014"); polygon(d, col="red", border="blue")

# Basic summary statistics
summary(mdl$XBenzene)
summary(mdl$XToluene)

# Save dataframe
# save(mdl,file="mdl_urban_nonpolar.Rda")