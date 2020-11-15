%% Partie IV Questions 5 - 9

p_th = [1 ; 0.3 ; 8.5 ; 8.5 ; 4 ; 3 ];
sigma = 0.1 ;
R = 20 ; C = 20;

[D_b,p_init,p_est] = IV_opti(p_th,sigma,R,C);
display(p_init);
display(p_est);
display(p_th);
save data_IV.mat p_est;

%% Partie IV Question 10

p_i = [1.2  0.4  8  9  6  5; 
       0.9  0.1  9  9  3  4;
       1.2  0.4  10  10  5  4;
       0.7  0.5  17  5  1  1.2];

p_est = IV_10(p_i,p_th,D_b,R,C);
disp(p_est)