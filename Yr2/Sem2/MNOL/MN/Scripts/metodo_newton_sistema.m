%% Método de Newton para resolver Sistemas de equações não lineares
% Com fsolve

%% Ponto inicial
% Como vetor coluna

x0 = [1;-2];

%% Opções
% display - off | iter | notify | final
% maxiter - nº máximo de iterações
% tolfun - valor de tolerância / erro

% op1 = optimset('tolfun', 1e-4, 'maxiter', 3, 'display', 'iter');

%% Fsolve

[x, fval,exitval,output] = fsolve(@fun,x0)

%% EXITVAL
% > 0 - encontrou e convergiu
% = 0 - máximo de iterações
% < 0 - divergiu

%% Função

function [f] = fun(x)

f(1) = -x(2) + 2*x(1)^2 - 4;
f(2) = -x(2) -x(2)^3 - x(1) - 8;

end