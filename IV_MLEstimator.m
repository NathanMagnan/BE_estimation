% Minimization problem

%% Initialization
load data.mat
d=D(:);
[R,C] = size(D);
[a_init,ind_max]=max(d);
c0_init=rem(ind_max,C);
r0_init=1+(ind_max-c0_init)/R;
b_init=min(d);
alpha_init = 2;
beta_init =  2;

p_init = [a_init; b_init; r0_init; c0_init; alpha_init; beta_init];
disp(p_init);
%% Minimization

%options = optimset('PlotFcns',@optimplotfval);
p_opt = fminsearch(@(p) IV_crit_J(p,D), p_init);
disp(p_opt);
dataplotp(p_opt,0);