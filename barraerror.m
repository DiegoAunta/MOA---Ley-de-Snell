function er = barraerror(x, y, erx, ery, col)
    er = errorbar(x,y,ery,ery,erx,erx,"LineStyle","none",color=col);
end