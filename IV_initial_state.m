%% load image size parameters
load data.mat
d=D(:);
[R,C] = size(D);

%% define initial parameters
[a_init,ind_max]=max(d);
c0_init=rem(ind_max,C);
r0_init=1+(ind_max-c0_init)/R;
b_init=min(d);
alpha_init = 2;
beta_init =  2;
nu = [r0_init; c0_init; alpha_init; beta_init];

%% draw initial image
[Cols, Rows] = meshgrid(1:C, 1:R);
PSF = Moffat(nu, Rows, Cols);
Model_init = a_init*PSF + b_init;
colormap('gray');
imagesc(Model_init); colorbar