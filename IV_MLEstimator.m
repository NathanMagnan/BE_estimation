% Minimization problem

%% Initialization
load data.mat
d=D(:);
[R,C] = size(D);
[a_init,ind_max]=max(d);
c0_init=rem(ind_max,C);
r0_init=(ind_max-c0_init)/R;
b_init=min(d);
alpha_init = 1;
beta_init = 2 ;

p_init = [a_init; b_init; r0_init; c0_init; alpha_init; beta_init];

%% Minimization

p_opt = fminsearch(@(p) Crit_J(p,D), p_init);
disp(p_opt)