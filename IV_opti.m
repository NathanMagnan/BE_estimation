% Paramètres : p_th, sigma, R , C, name (pour la sauvegarde)

function [D_b,p_init,p_est] = IV_opti(p_th,sigma,R,C)
    %% Données
    % Données théoriques
    D_th = cdata(p_th,0,R,C);
    % Données bruitées
    load data.mat
    D_b = D;%cdata(p_th,sigma,R,C);
    
    %% Résolution du pb d'optimisation
    d = D_b(:);
    [a_init,ind_max]=max(d);
    c0_init=rem(ind_max,C);
    r0_init=1+(ind_max-c0_init)/R;
    b_init=min(d);
    a_init=a_init;
    alpha_init = 2;
    beta_init =  2;
    % Initialisation
    p_init = [a_init; b_init; r0_init; c0_init; alpha_init; beta_init];
    D_init = cdata(p_init,0,R,C);
    % Minimisation
    p_est = fminsearch(@(p) IV_crit_J(p,D_b), p_init);
    D_est=cdata(p_est,0,R,C);
    
    %% Affichage
    figure
    colormap('gray');
    subplot(2,2,1);
    imagesc(D_b); colorbar
    title('Noisy data');
    subplot(2,2,2);
    imagesc(D_init); colorbar
    title("Initial PSF of optimization");
    subplot(2,2,4);
    imagesc(D_est); colorbar
    title('Estimated PSF');
    subplot(2,2,3);
    imagesc(D_th); colorbar
    title('Theorical (unnoisy) PSF');
    
    %% Résidus
    residuals(D_b,D_est);
 
end