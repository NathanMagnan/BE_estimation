%% Compute estimator (and also charges the data)
III_estimators

%% get the residuals
[Cols, Rows] = meshgrid(1:C, 1:R);
PSF_est = Moffat(nu, Rows, Cols);
D_est = theta_ML(1) * PSF_est + theta_ML(2);
Res = D - D_est;

%% Draw the residuals
figure(1)
colormap('gray');
imagesc(Res); colorbar
ax = figure(2);
r=Res(:);
hist(r);
title("Histograms of the residuals : ML estimator");
xlabel("residuals");
ylabel("number of pixels");