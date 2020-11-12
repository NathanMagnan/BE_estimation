%% importing the data
load data.mat
[R, C] = size(D);

%% choosing the metropolis-hastings parameters
n_steps = 10000;
n_burns = 3000; %% Should not be 0
tau = 0.007;

%% Running the metropolis-hastings algorithm
chain = V_Metropolis_Hastings(n_steps, n_burns, tau);

%% Computing the mean estimators
a_mcmc = mean(chain(1, :));
b_mcmc = mean(chain(2, :));
r_mcmc = mean(chain(3, :));
c_mcmc = mean(chain(4, :));
alpha_mcmc = mean(chain(5, :));
beta_mcmc = mean(chain(6, :));
nu_mcmc = [r_mcmc; c_mcmc; alpha_mcmc; beta_mcmc]; 

%% computing the estimated image
[Cols, Rows] = meshgrid(1:C, 1:R);
PSF_mcmc = Moffat(nu_mcmc, Rows, Cols);
D_mcmc = a_mcmc*PSF_mcmc + b_mcmc;

%% Plotting the residuals
residuals(D, D_mcmc)