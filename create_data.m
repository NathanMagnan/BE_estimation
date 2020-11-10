
%% Parameters
C = 20;
R = 20;
a = 1;
b = 0.3;
r0 = 8.5;
c0 = 8.5;
alpha = 4;
beta = 3;
p_th = [a; b; r0; c0; alpha; beta];
nu = [r0; c0; alpha; beta];
sigma = 0.1;

%% Create the image
[Cols, Rows] = meshgrid(1:C, 1:R);
PSF = Moffat(nu,Rows,Cols);
Model = a*PSF + b;
D = Model + sigma*randn(R,C);
colormap('gray');
imagesc(D); colorbar

%% Save the data
save data.mat D p_th