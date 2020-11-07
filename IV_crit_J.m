%% Cost Function to minimize
function [J, Model] = IV_crit_J(p,D)
    % Compute the model corresponding to parameters p
    [r,c] = size(D);
    [col,row] = meshgrid(1:c,1:r);
    a=p(1); 
    b=p(2);
    nu=p(3:6);
    Model = a*Moffat(nu,row,col)+b;
    % Compute the cost function
    J = (D(:)-Model(:)).' * (D(:)-Model(:));
end
