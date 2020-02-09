//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'y' of length 'N'.
data {
   int<lower=0> N; // number of data points
   vector[N] y; //
}
parameters {
   real mu; // group means
   real<lower=0> sigma; // common std
}
model {
   y ~ normal(mu, sigma);
}

generated quantities {
   real ypred;
   vector[N] log_lik;
   ypred = normal_rng(mu, sigma);
   for (i in 1:N)
      log_lik[i] = normal_lpdf(y[i] | mu, sigma);
}

