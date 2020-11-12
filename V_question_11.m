%% choosing the metropolis-hastings parameters
n_steps = 10000;
n_burns = 3000; %% Should not be 0
tau = 0.007;

%% Running the metropolis-hastings algorithm
chain = V_Metropolis_Hastings(n_steps, n_burns, tau);

%% Corner plot
Names = {"a", "b", "r_0", "c_0", "alpha", "beta"};
Truths = [1, 0.3, 8.5, 8.5, 4, 3];
Bounds = [0, 0, 5, 5, 0, 1; 2, 1, 15, 15, 1000, 1000];
cornerplot(chain, Names, Truths, Bounds)