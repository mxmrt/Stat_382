set.seed(30)

n_by_n_sym_rand_matrix = function(dist, n, para_1, para_2){  
  if (dist == "normal"){
    values = rnorm(n = n**2, mean = para_1, sd = para_2)
  }
  if (dist == "uniform"){
    values = runif(n = n**2, min = para_1, max = para_2)
  }
  if (dist == "gamma"){
    values = rgamma(n = n**2, shape = para_1, rate = para_2)
  }
  A = matrix(data = values ,nrow = n, ncol = n)
  
  # following code taken borrowed from:
  # http://stackoverflow.com/a/21825946
  # credit to StackOverflow user: user3318600
  A[lower.tri(A)] = t(A)[lower.tri(A)] 
  return(A)
}

fast_mat_exp = function(mat, exp) {
  decomp = svd(mat)
  D = diag(decomp$d)
  result = decomp$u %*% D**exp %*% solve(decomp$u)
  return(result)
}

WE= n_by_n_sym_rand_matrix(dist = "normal", n=10, para_1=1, para_2=4**.5)
WED = fast_mat_exp(mat=WE, exp=10); A_1_to_10