%% Charge data
load data.mat
d=D(:);
a = p_th(1);
b = p_th(2);
r0 = p_th(3);
c0 = p_th(4);
alpha = p_th(5);
beta = p_th(6);
nu = [r0; c0; alpha; beta];
[R, C] = size(D);
sigma = 0.1;

%% Create Matrix H
[Cols, Rows] = meshgrid(1:C, 1:R);
PSF = Moffat(nu, Rows, Cols);
PSF = PSF(:);
H = zeros(R*C, 2);
for r = 1:(R*C)
    for c = 1:2
        if c == 1
            H(r, c) = PSF(r);
        else
            H(r, c) = 1;
        end
    end
end

%% Compute ML estimators
theta_ML = inv(H.' * H) * H.' * d;
Gamma_ML = sigma^2 * inv(H.' * H);
