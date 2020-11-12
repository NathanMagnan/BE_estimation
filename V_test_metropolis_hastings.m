%% choosing the metropolis-hastings parameters
n_steps = 10000;
n_burns = 1; %% Should not be 0
tau = 0.007;

%% Running the metropolis-hastings algorithm
[chain, rate_accept] = V_Metropolis_Hastings(n_steps, n_burns, tau);
s = size(chain);

%% plotting the chain (parameter a)
figure(1)

X = zeros(s(2));
for k = 1:(s(2))
    X(k) = k;
end

Y = chain(5, 1:s(2));

plot(X, Y)
rate_accept