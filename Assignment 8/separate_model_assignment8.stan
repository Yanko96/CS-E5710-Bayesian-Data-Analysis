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
int<lower=0> K; // number of groups
int<lower=1,upper=K> x[N]; // group indicator
vector[N] y;
}
parameters {
vector[K] mu; // group means
vector<lower=0>[K] sigma; // group stds
}
model {
y ~ normal(mu[x], sigma[x]);
}
generated quantities {
real ypred;
vector[N] log_lik;
ypred = normal_rng(mu[6], sigma[6]);
for (i in 1:N)
    log_lik[i] = normal_lpdf(y[i] | mu[x[i]], sigma[x[i]]);
}
