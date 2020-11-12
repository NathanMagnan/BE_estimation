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
        subplot(n,3,3*(k-1)+1)
        imagesc(D_init); colorbar
        title("Donnees initiales de l'optimisation");
        subplot(n,3,3*(k-1)+2);
        imagesc(D_est); colorbar
        title('Données estimées');
        subplot(n,3,3*k);
        imagesc(D_th); colorbar
        title('Données théoriques');
    end
    
end