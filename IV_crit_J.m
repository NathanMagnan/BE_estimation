%% Cost Function to minimize
function [J, Model] = crit_J(p,D)
    % Compute the model corresponding to parameters p
    [R,C] = size(D);
    [Cols,Rows] = meshgrid(1:C,1:R);
    a=p(1); 
    b=p(2);
    nu=p(3:6);
    PSF = Moffat(nu,Rows,Cols);
    Model = a*PSF+b;
    % Compute the cost function
    J = (D-Model).' * (D-Model);
end
