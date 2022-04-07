%% Integração Numérica

%% Integral com função integrada
x0 = 0;
x1 = 1;
e1 = 0.0005; % erro de truncatura
Q = integral( @(x) x.^2 + 1./(x+1),x0,x1,'AbsTol', e1)

%% Integral com tabela de pontos (Trapézio)

x = [0,0.1,0.2,0.3,0.4,0.5,0.6,3.6,6.6,9.6,9.8,10];
f = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.65,0.6,0.6,0.7,0.8];

res = trapz(x,f)