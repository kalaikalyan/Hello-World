# Assignment: ASSIGNMENT 6
# Name: Kalyanasundaram, Kalaivani
# Date: 2021-07-30

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/kalya/Documents/Kalai/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

## Load the ggplot2 library
library(ggplot2)

## Fit a linear model using the `age` variable as the predictor and `earn` as the outcome
age_lm <-  lm(age ~ earn, heights_df)

## View the summary of your model using `summary()`
summary(age_lm)

## Creating predictions using `predict()`
age_predict_df <- data.frame(earn = predict(age_lm, heights_df), age= heights_df$age)

## Plot the predictions against the original data
ggplot(data = age_predict_df, aes(y = earn, x = age)) +
  geom_point(color='blue') +
  geom_line(color='red',data = heights_df, aes(y=earn, x=age))

mean_earn <- mean(heights_df$earn)
## Corrected Sum of Squares Total
sst <- sum((mean_earn - heights_df$earn)^2)
## Corrected Sum of Squares for Model
ssm <- sum((mean_earn - age_predict_df$earn)^2)
## Residuals
residuals <- heights_df$earn - age_predict_df$earn
## Sum of Squares for Error
sse <- sum(residuals^2)
## R Squared R^2 = SSM\SST
r_squared <- sse/sst

## Number of observations
n <- nrow(heights_df)
## Number of regression parameters
p <- 2
## Corrected Degrees of Freedom for Model (p-1)
dfm <- p-1
## Degrees of Freedom for Error (n-p)
dfe <- n-p
## Corrected Degrees of Freedom Total:   DFT = n - 1
dft <- n-1

## Mean of Squares for Model:   MSM = SSM / DFM
msm <- ssm/dfm
## Mean of Squares for Error:   MSE = SSE / DFE
mse <- sse/dfe
## Mean of Squares Total:   MST = SST / DFT
mst <- sst/dft
## F Statistic F = MSM/MSE
f_score <- msm/mse

## Adjusted R Squared R2 = 1 - (1 - R2)(n - 1) / (n - p)
adjusted_r_squared <- 1 - (1 - r_squared)*(n - 1) / (n - p)

## Calculate the p-value from the F distribution
p_value <- pf(f_score, dfm, dft, lower.tail=F)

library(readxl)
housing_df <- read_excel("data/week-7-housing.xlsx")

predict_lm <- lm(housing_df$`Sale Price` ~ housing_df$square_feet_total_living, housing_df)
predict_lm2 <- lm(housing_df$`Sale Price` ~ housing_df$square_feet_total_living + housing_df$bedrooms + housing_df$bath_full_count)

summary(predict_lm)
summary(predict_lm2)

library(lm.beta)
lm.beta(predict_lm)
lm.beta(predict_lm2)

confint(predict_lm)
confint(predict_lm2)

aov(predict_lm)
aov(predict_lm)
library(qqplotr)

qqplot(predict_lm, main="QQ Plot")
qqplot(predict_lm2, main="QQ Plot") 
library(car)
outliers <- outlierTest(predict_lm)
outliers2 <- outlierTest(predict_lm2)
resid <- resid(predict_lm)
resid2 <-resid(predict_lm2)

standard_res <- rstandard(predict_lm)
standard_res2 <- rstandard(predict_lm2)

sum(resid, na.rm = TRUE)
sum(resid2, na.rm= TRUE)