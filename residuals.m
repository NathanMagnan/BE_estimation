function residuals(D_bruit,D_est)
    res = D_bruit-D_est;
    r=res(:);
    disp(std(r));
    figure
    hist(r);
    figure
    colormap('gray');
    imagesc(res); colorbar
end