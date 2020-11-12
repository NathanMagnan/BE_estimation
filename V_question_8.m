%% choosing the metropolis-hastings parameters
n_steps = 10000;
n_burns = 3000; %% Should not be 0
tau = 0.007;

%% Running the metropolis-hastings algorithm
chain = V_Metropolis_Hastings(n_steps, n_burns, tau);

%% Estimate the parameters
a_mcmc = mean(chain(1, :));
b_mcmc = mean(chain(2, :));
r_mcmc = mean(chain(3, :));
c_mcmc = mean(chain(4, :));

%% Estimate the standard deviations
std_a_mcmc = std(chain(1, :))
std_b_mcmc = std(chain(2, :))
std_r_mcmc = std(chain(3, :))
std_c_mcmc = std(chain(4, :))

%% Compute the errors
error_a = a_mcmc - 1
error_b = b_mcmc - 0.3
error_r = r_mcmc - 8.5
error_c = c_mcmc - 8.5


