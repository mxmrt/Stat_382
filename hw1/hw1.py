import numpy
from scipy import stats 
import math
#   1.  Generate 100 normally distributed random variable with mean=0.5
#       and variance=9.

n = 100
sample = numpy.random.normal(loc = 0.5, scale = 3, size = n)


#   2.  Compute the sample mean and sample variance.

x_bar = numpy.mean(sample)
s_squared = numpy.var(sample)


#   3.  Compute the test statistics.

t_val = (x_bar - 0)/math.sqrt(s_squared/n)



#   4.  Compute the p-value.
print 2*(1-stats.t.cdf(t_val,n-1, q =True))
#p_value = pt(t, n-1, lower.tail = FALSE)*2


#   5.  Use the existing function or procedure to test the hypothesis. 
#       Compare the two results.

results = stats.ttest_1samp(sample, popmean=0)
print results
