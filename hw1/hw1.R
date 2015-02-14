#   1.  Generate 100 normally distributed random variable with mean=0.5
#       and variance=9.

n = 100; sample = rnorm(n, .5, 3)


#   2.  Compute the sample mean and sample variance.

x_bar = mean(sample); s_squared = var(sample)


#   3.  Compute the test statistics.

t = (x_bar - 0)/sqrt(s_squared/n)


#   4.  Compute the p-value.

p_value = pt(t, n-1, lower.tail = FALSE)*2


#   5.  Use the existing function or procedure to test the hypothesis. 
#       Compare the two results.

results = t.test(sample,mu=0)