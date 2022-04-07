%% Mínimos Quadrados

%% funções
% Modelo Polinomial:
% polyfit - determinar coeficientes do polinómio e obter resíduo
% polyval - obter estimativa segundo os coeficientes do polinómio
% Modelo Não Polinomial:
% lsqcurvefit - obter coeficientes do polinómio e o resíduo

%% Modelo Polinomial
%% Dados

x = [0 1.25 2.5 3.75];
f = [0.26 0.208 0.172 0.145];

%% Grau do polinómio
grau = 1;

%% Polinómio
[Pgrau,Sgrau] = polyfit(x,f,grau) % Pgrau - coeficientes do polinómio de grau *grau*
SQR = Sgrau.normr^2 % calcula a soma do quadrado dos resíduos (erro)

%% Estimar valor x0
x0 = 29;
fx0 = polyval(Pgrau, x0)

% representação do polinómio (opcional)
novo_x = 0:0.01:3.75;
novo_f = polyval(Pgrau, novo_x); %avalia o novo_x em P2
plot(x,f,'o', novo_x, novo_f, 'r')


%% Modelo Não Polinomial
x = [1 3 6 10 12];
f = [122 188 270 160 120];
[c, RESNORM] = lsqcurvefit(@fun ,[1,1],x,f)
% c -> vetor resultado com os coeficientes c (c1, c2, ..., cn)
% RESNORM -> Resíduo

%% Função

function [m] = fun(c,x)
m=c(1)./x+c(2).*x;
end