function grafconlineadetendencia(x , y, reg, col)
    plot(x, y,"LineStyle","none","Marker",".","MarkerSize",25,Color=col)

    x2 = feval(reg, x);
    plot(x, x2, "LineStyle","-","LineWidth",1,color=col)

end