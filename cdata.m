function D = cdata(p,sig,R,C)
    nu = [p(3); p(4); p(5); p(6)];
    [Cols, Rows] = meshgrid(1:C, 1:R);
    PSF = Moffat(nu,Rows,Cols);
    Model = p(1)*PSF + p(2);
    D = Model + sig*randn(R,C);
end
