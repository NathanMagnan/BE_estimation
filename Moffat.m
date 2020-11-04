function PSF = Moffat(nu,Rows,Cols)
    PSF = (1 + ((Rows - nu(1)).^2 + (Cols - nu(2)).^2) / (nu(3)^2)).^(- nu(4));
end    