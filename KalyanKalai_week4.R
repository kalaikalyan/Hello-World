# Assignment: ASSIGNMENT 4
# Name: Kalyanasundaram, Kalaivani
# Date: 2021-07-1

## Load the ggplot2 package
library(ggplot2)
library(qqplotr)
library(pastecs)
library(plyr)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/kalya/Documents/Kalai/dsc520")

data<- read.csv("data/scores.csv")

sports <- data[data$Section == "Sports",]
sports
regular <- data[data$Section == "Regular",]
regular


ggplot(sports, aes(Score)) + ggtitle("Sports Section") + xlab("Student Scores") + ylab("Frequency")+ geom_histogram(bins = 8)
ggplot(regular, aes(Score)) + ggtitle("Regular Section") + xlab("Student Scores") + ylab("Frequency")+ geom_histogram(bins = 8)


summary.data.frame(sports)
summary.data.frame(regular)

setwd("/Users/kalya/Documents/Kalai/dsc520")

census <- read.csv("data/acs-14-1yr-s0201.csv")
applymean <- census[c("HSDegree","BachDegree")]
applyresult <- apply(applymean, 2, mean)
applyresult
aggregate(census$Geography, by = list(census$Geography), FUN = length)

result <- ddply(census, c("HSDegree","BachDegree"), function(df)mean(df$PopGroupID))
result

ggplot(census, aes(HSDegree)) + ggtitle("High School Degree Completion in American Communities") + xlab("% of Total Population") + ylab("Frequency")+ geom_histogram(bins = 50)
ggplot(census, aes(BachDegree)) + ggtitle("Bachelor Degree Completion in American Communities") + xlab("% of Total Population") + ylab("Frequency")+ geom_histogram(bins = 50)

ggplot(census) +
  aes(x = "", y = HSDegree) +
  geom_boxplot(fill = "#0c4c8b") +
  theme_minimal()
ggplot(census) +
  aes(x = "", y = BachDegree) +
  geom_boxplot(fill = "#0c4c8b") +
  theme_minimal()

