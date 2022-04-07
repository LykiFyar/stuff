%% Método de Newton - Resolução de equação não linear - fsolve

%% Gráfico
fplot(@(x) fun(x), [100,150]);
grid;

%% Ponto inicial

ponto = 140;

%% Resolver com opções
% display - off | iter | notify | final
% maxiter - nº máximo de iterações
% tolfun - valor de tolerância / erro

op1 = optimset('tolfun', 1e-4, 'maxiter', 3, 'display', 'iter');
[x, fval,exitval,output] = fsolve(@fun,ponto, op1);

%% EXITVAL
% > 0 - encontrou e convergiu
% = 0 - máximo de iterações
% < 0 - divergiu

%% Função

function f = fun(x)
f = x*(x-40)^2 - 918.35*1700/1.025;
end