function [cmcor, imcor, cbcor, ibcor] = redondeo(cm, im, cb, ib)

    format short
    
    ordm = floor(log10(abs(im)));
    
    cmcor = round(cm, -ordm);
    imcor = round(im, -ordm);
    
    ordb = floor(log10(abs(ib)));
    
    cbcor = round(cb, -ordb);
    ibcor = round(ib, -ordb);
end