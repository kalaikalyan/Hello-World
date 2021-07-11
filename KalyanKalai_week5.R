# Assignment: ASSIGNMENT 4
# Name: Kalyanasundaram, Kalaivani
# Date: 2021-07-1

## Load the package
library(pastecs)
library(plyr)
library(dplyr)
library(purrr)

setwd("/Users/kalya/Documents/Kalai/dsc520")

census <- read.csv("data/acs-14-1yr-s0201.csv")
census %>% filter(BachDegree == "37.7")
census %>% arrange(desc(HSDegree))
census %>% select(HSDegree,BachDegree)
census %>% mutate(HSDegree_prob = HSDegree/100)
census %>% summarize(HSDegree = mean(HSDegree, na.rm = TRUE))
group_by(census, Geography)
census %>% keep(~{mean(census$HSDegree) > 70})
census %>% compact()
newColumn <- 0
newCensus <- cbind(census, newColumn)
newRow <- 0
newCensuswithrow <- rbind(census, newRow)
strings <- "Kalaivani, Kalyan"
split <- strsplit(strings, split=", ")
paste("Kalaivani", "Kalyan", sep=", ")
