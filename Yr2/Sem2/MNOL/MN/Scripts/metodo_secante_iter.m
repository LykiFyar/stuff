%% Método Secante - iteração

%% Pontos
x1 = 0; % 1º ponto
x2 = 0.5940; % 2º ponto

%% f(x1) e f(x2)

fx1 = fun(x1)
fx2 = fun(x2)

%% próximo x

prox_x = x2 - ((x2 - x1)*fx2)/(fx2 - fx1)

%% Critérios de paragem

fun_prox_x = fun(prox_x)

e_1 = abs(prox_x - x2) / abs(prox_x)

e_2 = abs(fun_prox_x)

%% Função
function [y] = fun(x)
    y = exp(-0.5.*x)./cosh(exp(0.5.*x)) - sqrt(0.5.*0.088);
end