%% Método de Newton - iteração

%% Ponto
x1 = 5; 

%% f(x1)

fx1 = fun(x1)

%% próximo x

f_linha_1 =  -1.5*70*exp(-1.5*x1) - 0.075 * 25 * exp(-0.075*x1)

x2 = x1 - fx1 / f_linha_1

%% Critérios de paragem

fx2 = fun(x2)

e_1 = abs(x2 - x1) / abs(x2)

e_2 = abs(fx2)

%% Função
function [y] = fun(x)
    y = 70*exp(-1.5.*x) + 25*exp(-0.075.*x) - 9;
end