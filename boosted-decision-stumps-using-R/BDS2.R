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

# Calculate MSE test using BDS
B <- 1000
fhat <- matrix(nrow=B,ncol=nrow(X_train),byrow=TRUE)
for(b in 1:B){
  # Fit the decision stump to training data
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
  rss_lstat_min = min(rss_lstat_vec)
  rss_lstat_min_index = which.min(rss_lstat_vec)
  
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
  
  # Update the residuals with the decision stump
  if(rss_lstat_min <= rss_rm_min){
    s_value <- s_lstat[rss_lstat_min_index]
    sum_lstat_less2 <- 0
    sum_lstat_greater2 <- 0
    ctr_lstat_less2 <- 0
    ctr_lstat_greater2 <- 0
    for(i in 1:nrow(X_train)){
      if(X_train$lstat[i] < s_value){
        sum_lstat_less2 <- sum_lstat_less2 + y_train[i]
        ctr_lstat_less2 <- ctr_lstat_less2 + 1
      }
      else{
        sum_lstat_greater2 <- sum_lstat_greater2 + y_train[i]
        ctr_lstat_greater2 <- ctr_lstat_greater2 + 1
      }
      mean_lstat_less2 <- sum_lstat_less2/ctr_lstat_less2
      mean_lstat_greater2 <- sum_lstat_greater2/ctr_lstat_greater2
      
      if(X_train$lstat[i]<s_value){
        fhat[b,i] <- mean_lstat_less2
      } else {
        fhat[b,i] <- mean_lstat_greater2
      }
      y_train[i] <- y_train[i] - 0.01*fhat[b,i]
    }
  } else {
    s_value = s_rm[rss_rm_min_index]
    sum_rm_less2 <- 0
    sum_rm_greater2 <- 0
    ctr_rm_less2 <- 0
    ctr_rm_greater2 <- 0
    for(i in 1:nrow(X_train)){
      if(X_train$rm[i] < s_value){
        sum_rm_less2 <- sum_rm_less2 + y_train[i]
        ctr_rm_less2 <- ctr_rm_less2 + 1
      }
      else{
        sum_rm_greater2 <- sum_rm_greater2 + y_train[i]
        ctr_rm_greater2 <- ctr_rm_greater2 + 1
      }
      mean_rm_less2 <- sum_rm_less2/ctr_rm_less2
      mean_rm_greater2 <- sum_rm_greater2/ctr_rm_greater2
      
      if(X_train$rm[i]<s_value){
        fhat[b,i] <- mean_rm_less2
      } else {
        fhat[b,i] <- mean_rm_greater2
      }
      y_train[i] <- y_train[i] - 0.01*fhat[b,i]
    }
  }
  
}

# Calculate MSE Test using the prediction rule
summation <- 0
for(i in 1:nrow(X_test)){
  fhat_x = sum(0.01*fhat[,i])
  summation <- summation + (y_test[i] - fhat_x)^2
}
mse_test <- summation/nrow(X_test)