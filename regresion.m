function  [mdl, coefm, incerm, coefb, incerb] = regresion(x, y)
    mdl = fitlm(x, y);
    coefm = mdl.Coefficients.Estimate(2);
    incerm = mdl.Coefficients.SE(2);
    coefb = mdl.Coefficients.Estimate(1);
    incerb = mdl.Coefficients.SE(1);
end