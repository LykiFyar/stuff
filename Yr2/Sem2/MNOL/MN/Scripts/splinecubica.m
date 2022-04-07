% Spline Cúbica Completa

%% Dados

x = [10,12,18,27,30,34];
y = [20,18,15,9,12,10];

%% spline cúbica completa
% guardar 2º e penultimo pontos para estimar f'0 e f'n

xx = [10 18 27 34];
yy = [20,15,9,10];

f_linha_0 = (20-18)/(10-12);
f_linha_n = (12-10)/(30-34);

s_completa = spline(xx, [f_linha_0 yy f_linha_n]);

% para ver os segmentos da spline, fazer:
s_completa.coefs

% a 1ª linha corresponde aos coeficientes do segmento 1 entre [xx0,xx1]
% s^1_3(x) = -0.007 (...) e etc

% para calcular o valor de s(x), fazer:
x = 29;
s_x = spline(xx, [f_linha_0 yy f_linha_n], x) % s_3(x)
