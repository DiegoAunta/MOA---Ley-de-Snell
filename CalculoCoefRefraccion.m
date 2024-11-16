% Incertidumbres
errx = 0.05;% [cm]
erry = 0.05;% [cm]

% Angulos usados(en readianes)
theta1 = 0.970310377;% 56 grados
theta2 = 0.740541646;% 42 grados
theta3 = 0.300415446;% 17 grados
% Incertidumbres
dtheta1 = 0.01;% 56 grados
dtheta2 = 0.01;% 42 grados
dtheta3 = 0.01;% 17 grados

% Calculo de las regresiones
[reg1, cm1, im1, cb1, ib1] = regresion(x1, y1);
[reg2, cm2, im2, cb2, ib2] = regresion(x2, y2);
[reg3, cm3, im3, cb3, ib3] = regresion(x3, y3);

% Redondeo Cifras Significativas
[cm1cor, im1cor, cb1cor, ib1cor] = redondeo(cm1, im1, cb1, ib1);
[cm2cor, im2cor, cb2cor, ib2cor] = redondeo(cm2, im2, cb2, ib2);
[cm3cor, im3cor, cb3cor, ib3cor] = redondeo(cm3, im3, cb3, ib3);

% Grafica
figure;
hold on

% Graficar con línea de tendencia y colores diferentes
grafconlineadetendencia(x1, y1, reg1, "b");  % Azul
grafconlineadetendencia(x2, y2, reg2, "r");  % Rojo
grafconlineadetendencia(x3, y3, reg3, "k");  % Negro

xlabel h[cm]
ylabel x[cm]
% xlim ([0 0.31])
% ylim ([0 0.1])
set(gca, "Fontsize", 30, "FontName", "Cambria Math") % Opciones de fuente y tamaño

% Establecer el renderer predeterminado a 'painters'
set(gcf, 'Renderer', 'painters');

% % Cambiar la escala del eje Y a notación científica
% ax = gca; % Obtén el objeto de ejes actual
% ax.XAxis.Exponent = -3;
% ax.YAxis.Exponent = -3;

% Graficar barras de error con diferentes colores
barraerror(x1, y1, errx, erry, "b");  % Azul
barraerror(x2, y2, errx, erry, "r");  % Rojo
barraerror(x3, y3, errx, erry, "k");  % Negro


legend ("","56°:x(h)=("+cm1cor+"\pm"+im1cor+")h+("+cb1cor+"\pm"+ib1cor+")","","42°:x(h)=("+cm2cor+"\pm"+im2cor+")h+("+cb2cor+"\pm"+ib2cor+")","","17°:x(h)=("+cm3cor+"\pm"+im3cor+")h+("+cb3cor+"\pm"+ib3cor+")")
Hlegend=legend;
set(Hlegend, "fontsize", 25);

% Calculo de los indices de refraccion

n1 = sin(theta1)*sqrt((1/(cm1^2))+1);
n2 = sin(theta2)*sqrt((1/(cm2^2))+1);
n3 = sin(theta3)*sqrt((1/(cm3^2))+1);
% Incertidumbre
dn1 = abs(dtheta1)*abs(cos(theta1)*sqrt((1/(cm1^2))+1))+abs(im1)*abs(sin(theta1)*(1/sqrt((1/cm1^2)+1))*(1/(cm1^3)));
dn2 = abs(dtheta2)*abs(cos(theta2)*sqrt((1/(cm2^2))+1))+abs(im2)*abs(sin(theta2)*(1/sqrt((1/cm2^2)+1))*(1/(cm2^3)));
dn3 = abs(dtheta3)*abs(cos(theta3)*sqrt((1/(cm3^2))+1))+abs(im3)*abs(sin(theta3)*(1/sqrt((1/cm3^2)+1))*(1/(cm3^3)));

% Crear Matriz para exportar

A = ["n1", n1, dn1;"n2", n2, dn2;"n3", n3, dn3];

% Exportar la matriz a un archivo de texto
writematrix(A, 'indices.txt', 'Delimiter', 'tab');

grid on
grid minor