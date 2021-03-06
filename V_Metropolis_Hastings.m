function [chain, rate_accept] = Metropolis_Hastings(n_steps, n_burns, tau)
    %% charge parameters
    load data.mat
    d=D(:);
    [R, C] = size(D);
    sigma = 0.1;

    %% initialisation
    a_prop = rand() * max(d) * 2;
    b_prop = rand() * max(d);
    r0_prop = R/4 + rand() * R/2;
    c0_prop = C/4 + rand() * C/2;
    alpha_prop = rand() * 1000;
    beta_prop = 1 + rand() * 1000;
    p_old = [a_prop; b_prop; r0_prop; c0_prop; alpha_prop; beta_prop];
    crit_old = IV_crit_J(p_old, D) / (2 * sigma^2);
    n_accept = 0;
    
    % Crating the chain
    chain = zeros(6, n_steps);
    
    % preparing the acceptance tests
    V_inf = [0; 0; R/4; C/4; 0; 1];
    V_sup = [2 * max(d); max(d); 3 * R/4; 3* C/4; 1000; 1001];

    %% iterations
    for k = 1:n_steps
        %% proposition
        a_prop = random('Normal', p_old(1), tau * 2 * max(d));
        b_prop = random('Normal', p_old(2), tau * max(d));
        r0_prop = random('Normal', p_old(3), tau * R/2);
        c0_prop = random('Normal', p_old(4), tau * C/2);
        alpha_prop = random('Normal', p_old(5), tau * 1000);
        beta_prop = random('Normal', p_old(6), tau * 1000);
        p_new = [a_prop; b_prop; r0_prop; c0_prop; alpha_prop; beta_prop];
        chain(:, k) = p_new;

        %% acceptance
        u = log(rand());
        if (p_new <= V_sup) & (p_new >= V_inf)
            crit_new = IV_crit_J(p_new, D) / (2 * sigma^2);
            v = -(crit_new - crit_old);
            if (u < v) 
                p_old = p_new;
                crit_old = crit_new;
                n_accept = n_accept + 1;
            end
        end
    end
    
    rate_accept = n_accept / n_steps;

    %% burn-in
    chain = chain(:, n_burns:length(chain));
end