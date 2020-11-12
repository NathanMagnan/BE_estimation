function residuals(D_bruit,D_est)
    res = D_bruit-D_est;
    r=res(:);
    disp(std(r));
    figure(1)
    hist(r);
    figure(2)
    colormap('gray');
    imagesc(res); colorbar
end