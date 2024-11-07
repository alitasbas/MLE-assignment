
samples <- list()

for(n in c(10, 30, 50, 100, 200)) {
  total_no_of_samples <- 100000 / n
  
  maxes_vector <- c()
  for (i in 1:total_no_of_samples) {
    x_n <- max(runif(n, 0, 3))
    maxes_vector <- c(maxes_vector, x_n)
  }
  samples[[as.character(n)]] <- maxes_vector
}

# It took me 3 hours to write this :(

# Our final output "samples" is a list of elements: 10, 30, 50, 100, 200

# Each element has the X(n) order statisctic ~ max value ~ MLE estimator
# of a sample of the respective size.

# For each sample size this was repeated for 100000 / n*.

# Now to visualize our findings

library(ggplot2)

pi <- 1
p <- list()
for (samples_of_size_n in samples) {
  df <- as.data.frame(samples_of_size_n)
  p[[as.character(pi)]] <- ggplot(df, aes(samples_of_size_n)) +
    geom_histogram() +
    geom_density() +
    xlab(paste("sample size:", pi))
  pi <- pi +1 
  }

# BAN stands for Best Asymptotic Normal
# As sample size n increases, we see an improvement in our estimator.
# Furthermore, mean approaches 3. Variance decreases, and Normality seems to be forming.
# It seems to be a BAN estimator as we see all across improvements as n increases.

