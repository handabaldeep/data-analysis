# Load libraries and the Boston data set
library(ISLR)
library(MASS)
data("Boston")
attach(Boston)

# Split data into training and test sets
X <- data.frame(lstat,rm)
y <- data.frame(medv)
set.seed(0831)
X_train <- sample(1:nrow(Boston),nrow(Boston)/2)
X_test <- X[-X_train,]
y_train <- y[X_train,]
y_test <- y[-X_train,]
X_train <- X[X_train,]

# Calculate training RSS of decision stump(lstat,s_lstat)
s_lstat <- seq(1.8,37.9,0.1)
rss_lstat_vec <- c()
for (i in 1:length(s_lstat)){
  sum_lstat_less <- 0
  sum_lstat_greater <- 0
  ctr_lstat_less <- 0
  ctr_lstat_greater <- 0
  for(j in 1:nrow(X_train)){
    if(X_train$lstat[j] < s_lstat[i]){
      sum_lstat_less <- sum_lstat_less + y_train[j]
      ctr_lstat_less <- ctr_lstat_less + 1
    }
    else{
      sum_lstat_greater <- sum_lstat_greater + y_train[j]
      ctr_lstat_greater <- ctr_lstat_greater + 1
    }
  }
  mean_lstat_less <- sum_lstat_less/ctr_lstat_less
  mean_lstat_greater <- sum_lstat_greater/ctr_lstat_greater
  
  total_sum_lstat_less <- 0
  total_sum_lstat_greater <- 0
  for(k in 1:nrow(X_train)){
    if(X_train$lstat[k] < s_lstat[i]){
      total_sum_lstat_less <- total_sum_lstat_less + (y_train[k] - mean_lstat_less)^2
    }
    else{
      total_sum_lstat_greater <- total_sum_lstat_greater + (y_train[k] - mean_lstat_greater)^2
    }
  }
  rss_lstat_vec <- c(rss_lstat_vec,total_sum_lstat_less+total_sum_lstat_greater)
}
# Find the minimum RSS for lstat
rss_lstat_min = min(rss_lstat_vec)
rss_lstat_min_index = which.min(rss_lstat_vec)

# Calculate training RSS of decision stump(rm,s_rm)
s_rm <- seq(3.6,8.7,0.1)
rss_rm_vec <- c()
for (i in 1:length(s_rm)){
  sum_rm_less <- 0
  sum_rm_greater <- 0
  ctr_rm_less <- 0
  ctr_rm_greater <- 0
  for(j in 1:nrow(X_train)){
    if(X_train$rm[j] < s_rm[i]){
      sum_rm_less <- sum_rm_less + y_train[j]
      ctr_rm_less <- ctr_rm_less + 1
    } else {
      sum_rm_greater <- sum_rm_greater + y_train[j]
      ctr_rm_greater <- ctr_rm_greater + 1
    }
  }
  mean_rm_less <- sum_rm_less/ctr_rm_less
  mean_rm_greater <- sum_rm_greater/ctr_rm_greater
  
  total_sum_rm_less <- 0
  total_sum_rm_greater <- 0
  for(k in 1:nrow(X_train)){
    if(X_train$rm[k] < s_rm[i]){
      total_sum_rm_less <- total_sum_rm_less + (y_train[k] - mean_rm_less)^2
    } else {
      total_sum_rm_greater <- total_sum_rm_greater + (y_train[k] - mean_rm_greater)^2
    }
  }
  rss_rm_vec <- c(rss_rm_vec,total_sum_rm_less+total_sum_rm_greater)
}
rss_rm_min = min(rss_rm_vec)
rss_rm_min_index = which.min(rss_rm_vec)

# Calculate test RSS using the selected decision stump (lstat,s_value)
if(rss_lstat_min <= rss_rm_min){
  s_value = s_lstat[rss_lstat_min_index]
  sum_lstat_less_test <- 0
  sum_lstat_greater_test <- 0
  ctr_lstat_less_test <- 0
  ctr_lstat_greater_test <- 0
  for(j in 1:nrow(X_test)){
    if(X_test$lstat[j] < s_value){
      sum_lstat_less_test <- sum_lstat_less_test + y_test[j]
      ctr_lstat_less_test <- ctr_lstat_less_test + 1
    } else {
      sum_lstat_greater_test <- sum_lstat_greater_test + y_test[j]
      ctr_lstat_greater_test <- ctr_lstat_greater_test + 1
    }
  }
  mean_lstat_less_test <- sum_lstat_less_test/ctr_lstat_less_test
  mean_lstat_greater_test <- sum_lstat_greater_test/ctr_lstat_greater_test
  
  total_sum_lstat_less_test <- 0
  total_sum_lstat_greater_test <- 0
  for(k in 1:nrow(X_test)){
    if(X_test$lstat[k] < s_value){
      total_sum_lstat_less_test <- total_sum_lstat_less_test + (y_test[k] - mean_lstat_less_test)^2
    } else {
      total_sum_lstat_greater_test <- total_sum_lstat_greater_test + (y_test[k] - mean_lstat_greater_test)^2
    }
  }
  rss_test <- total_sum_lstat_less_test+total_sum_lstat_greater_test
} else {
  s_value = s_rm[rss_rm_min_index]
  sum_rm_less_test <- 0
  sum_rm_greater_test <- 0
  ctr_rm_less_test <- 0
  ctr_rm_greater_test <- 0
  for(j in 1:nrow(X_test)){
    if(X_test$rm[j] < s_value){
      sum_rm_less_test <- sum_rm_less_test + y_test[j]
      ctr_rm_less_test <- ctr_rm_less_test + 1
    } else{
      sum_rm_greater_test <- sum_rm_greater_test + y_test[j]
      ctr_rm_greater_test <- ctr_rm_greater_test + 1
    }
  }
  mean_rm_less_test <- sum_rm_less_test/ctr_rm_less_test
  mean_rm_greater_test <- sum_rm_greater_test/ctr_rm_greater_test
  
  total_sum_rm_less_test <- 0
  total_sum_rm_greater_test <- 0
  for(k in 1:nrow(X_test)){
    if(X_test$rm[k] < s_value){
      total_sum_rm_less_test <- total_sum_rm_less_test + (y_test[k] - mean_rm_less_test)^2
    } else{
      total_sum_rm_greater_test <- total_sum_rm_greater_test + (y_test[k] - mean_rm_greater_test)^2
    }
  }
  rss_test <- total_sum_rm_less_test+total_sum_rm_greater_test
}

# Calculate test MSE using the test RSS
mse_test <- rss_test/length(y_test)
# Observations-
# RSS Test - 12986.38
# MSE Test - 51.32956
