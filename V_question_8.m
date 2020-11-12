%% choosing the metropolis-hastings parameters
n_steps = 10000;
n_burns = 3000; %% Should not be 0
tau = 0.007;

%% Running the metropolis-hastings algorithm
chain = V_Metropolis_Hastings(n_steps, n_burns, tau);

%% Computing the mean estimators
a_mcmc = std(chain(1, :))
b_mcmc = std(chain(2, :))
r_mcmc = std(chain(3, :))
c_mcmc = std(chain(4, :))