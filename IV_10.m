% Comparaison différents points de départ de l'algorithme d'optimisation

function p_est = IV_10(p_init,p_th,D_b,R,C)
    % Données théoriques
    D_th = cdata(p_th,0,R,C);
    [n,l] = size(p_init);
    p_est = zeros(n,6);
    figure
    colormap('gray');
    for k =1:n
        D_init = cdata(p_init(k,:),0,R,C);
        % Minimisation
        p_est(k,:) = fminsearch(@(p) IV_crit_J(p,D_b), p_init(k,:));
        D_est = cdata(p_est(k,:),0,R,C);
        % Affichage
        subplot(n,2,2*(k-1)+1)
        imagesc(D_init); colorbar
        title({'Initial parameters';['a=',num2str(p_init(k,1)),'  b=',num2str(p_init(k,2)),'  r_0=',num2str(p_init(k,3)),'  c_0=',num2str(p_init(k,4)),'  \alpha=',num2str(p_init(k,5)),'  \beta=',num2str(p_init(k,6))]});
        subplot(n,2,2*k);
        imagesc(D_est); colorbar
        title('Estimated PSF');
    end
    
end