%% Método de Nelder-Mead

%% Ponto - X1 apenas, retirado do Simplex

X1 = [1;1];

%% Opções
% MaxFunEvals - Nº máximo de cálculos da função
% MaxIter - Nº máximo de iterações
% TolFun - Tolerância de paragem da função objetivo
% TolX - Tolerância de paragem de x
% PlotFcns - Representa graficamente a evolução do algoritmo
%   - @optimplotx - desenha o ponto actual.
%   - @optimplotfunccount - desenha o nº de cálculos da função objetivo.
%   - @optimplotfval - desenha o valor da função objetivo.

opt = optimset("maxiter", 4);

%% Fminsearch
% EXITFLAG  1 -> convergiu
%           0 -> excedeu o MaxIter
%          -1 -> Não convergiu

[X FVAL EXITFLAG OUTPUT] = fminsearch(@fun,X1, opt)

%% Função
% Atenção -> fun é a função a minimizar
function [y] = fun(x)
    y = max(abs(x(1)),abs(x(2)-1));
end