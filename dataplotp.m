function dataplotp(p,sig)
    C = 20;
    R = 20;
    nu = [p(3); p(4); p(5); p(6)];
    [Cols, Rows] = meshgrid(1:C, 1:R);
    PSF = Moffat(nu,Rows,Cols);
    Model = p(1)*PSF + p(2);
    if(sig==0)
        D=Model;
    else
        D = Model + sig*randn(R,C);
    end
    figure();
    colormap('gray');
    imagesc(D); colorbar
end
