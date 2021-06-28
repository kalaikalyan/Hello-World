# Assignment: ASSIGNMENT 3
# Name: Kalyanasundaram, Kalaivani
# Date: 2021-06-26

## Load the ggplot2 package
library(ggplot2)
library(qqplotr)
library(pastecs)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/kalya/Documents/Kalai/dsc520")

data<- read.csv("data/acs-14-1yr-s0201.csv")


str(data)
nrow(data)
ncol(data)
ggplot(data, aes(HSDegree)) + ggtitle("High School Degree Completion in American Communities") + xlab("% of Total Population") + ylab("Frequency")+ geom_histogram(bins = 50)
ggplot(data, aes(HSDegree)) + ggtitle("High School Degree Completion in American Communities") + xlab("% of Total Population") + ylab("Frequency")+ geom_density()

qplot(sample = data$HSDegree, stat="qq")
stat.desc(data$HSDegree, norm = TRUE)