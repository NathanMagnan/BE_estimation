function chain = Metropolis_Hastings(n_steps, n_burns, tau)
    %% charge parameters
    load data.mat
    d=D(:);
    a = p_th(1);
    b = p_th(2);
    r0 = p_th(3);
    c0 = p_th(4);
    alpha = p_th(5);
    beta = p_th(6);
    [R, C] = size(D);
    sigma = 0.1;

    %% initialisation
    a_prop = rand() * max(d) * 2;
    b_prop = rand() * max(d);
    r0_prop = R/4 + rand() * R/2;
    c0_prop = C/4 + rand() * C/2;
    alpha_prop = rand() * 1000;
    beta_prop = 1 + rand() * 1000;
    p_new = [a_prop; b_prop; r0_prop; c0_prop; alpha_prop; beta_prop];
    chain = reshape(p_new, [6, 1]);

    %% iterations
    for k = 1:n_steps
        %% proposition
        s = size(chain);
        p_old = chain(:, s(2));
        a_prop = random('Normal', p_old(1), tau * 2 * max(d));
        b_prop = random('Normal', p_old(2), tau * max(d));
        r0_prop = random('Normal', p_old(3), tau * R/2);
        c0_prop = random('Normal', p_old(4), tau * C/2);
        alpha_prop = random('Normal', p_old(5), tau * 1000);
        beta_prop = random('Normal', p_old(6), tau * 1000);
        p_new = [a_prop; b_prop; r0_prop; c0_prop; alpha_prop; beta_prop];

        %% acceptance
        u = log(rand());
        v = -(IV_crit_J(p_new, D) / (2 * sigma^2) - IV_crit_J(p_old, D) / (2 * sigma^2));
        if u < v
            chain = [chain, p_new];
        end
    end

    %% burn-in
    chain = chain(:, n_burns:length(chain));
end