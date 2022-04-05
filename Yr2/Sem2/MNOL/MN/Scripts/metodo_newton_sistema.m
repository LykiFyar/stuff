%% Método de Newton para resolver Sistemas de equações não lineares
% Com fsolve
%% Ponto inicial
% Como vetor coluna
x0 = [1;-2];

% resolver sem opções
[x, fval,exitval,output] = fsolve(@fun,x0)

%% Função
function [f] = fun(x)

f(1) = -x(2) + 2*x(1)^2 - 4;
f(2) = -x(2) -x(2)^3 - x(1) - 8;

end