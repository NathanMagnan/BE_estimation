%% choosing the metropolis-hastings parameters
n_steps = 10000;
n_burns = 3000; %% Should not be 0
tau = 0.007;

%% Running the metropolis-hastings algorithm
chain = V_Metropolis_Hastings(n_steps, n_burns, tau);

%% Estimate the standard deviations
std_a_mcmc = std(chain(1, :))
std_b_mcmc = std(chain(2, :))
std_r_mcmc = std(chain(3, :))
std_c_mcmc = std(chain(4, :))
std_alpha_mcmc = std(chain(5, :))
std_beta_mcmc = std(chain(6, :))

%% Renormalizing the chain
chain(1, :) = chain(1, :) / std_a_mcmc;
chain(2, :) = chain(2, :) / std_b_mcmc;
chain(3, :) = chain(3, :) / std_r_mcmc;
chain(4, :) = chain(4, :) / std_c_mcmc;
chain(5, :) = chain(5, :) / std_alpha_mcmc;
chain(6, :) = chain(6, :) / std_beta_mcmc;

%% Computing the covariance matrix
C = cov(chain.')
