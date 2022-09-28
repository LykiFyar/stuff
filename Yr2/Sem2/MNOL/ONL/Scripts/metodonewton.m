%% Método Quasi-Newton e Segurança de Newton (trust-region)
% Segurança de newton (trust-region): GradObj = 'on' e temos de dar o gradiente

%% Ponto inicial

x0 = [0;0];

%% Opções
% Algorithm - Escolher o algoritmo: 'quasi-newton' (default) ou 'trust-region' (requer que seja dado o gradiente)
% MaxFunEvals - Nº máximo de cálculos da função
% MaxIter - Nº máximo de iterações
% TolFun - Tolerância de paragem da função objetivo
% TolX - Tolerância de paragem de x
% PlotFcns - Representa graficamente a evolução do algoritmo
%   - @optimplotx - desenha o ponto actual.
%   - @optimplotfunccount - desenha o nº de cálculos da função objetivo.
%   - @optimplotfval - desenha o valor da função objetivo.
%   - @optimplotstepsize - desenha o comprimento do passo.
%   - @optimplotfirstorderopt - desenha a medida de otimalidade de 1a ordem.
% GradObj - Gradiente da função objetivo definido pelo utilizador:
%   - on - usa o gradiente definido pelo utilizador.
%   - off - (default) aproxima o gradiente por diferenças finitas
% Hessian - Modo de definição da Hessiana:
%   - on - dada pelo utilizador
%   - off - (default) aproxima a Hessiana por diferenças finitas
% HessUpdate - Método para escolher a direção de pesquisa no algoritmo quasi-Newton.
%   - bfgs - (default) aproxima a Hessiana pela fórmula BFGS
%   - lbfgs - aproxima a Hessiana pela Low-memory BFGS (problemas de grandes dimensões)
%   - dfp - aproxima a Hessiana pela fórmula DFP

opt = optimset('HessUpdate', 'dfp', 'MaxIter', 1);

%% Fminunc

[x,fval,exitflag,output] = fminunc(@fun, x0, opt)

% EXITFLAG  1 -> convergiu
%           0 -> excedeu o MaxIter
%          -1 -> Não convergiu
%          -3 -> Problema não limitado

%% Função
% Atenção -> fun é a função a minimizar
function [y] = fun(x)
   y = 4.*x(1)^2 + 3.*x(2)^2 -4*x(1).*x(2) - 20.*x(1) - 26.*x(2);
end