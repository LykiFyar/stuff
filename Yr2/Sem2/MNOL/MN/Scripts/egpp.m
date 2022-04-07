clear variables
%% Matriz A
A = [290 -12.29067; -12.29067 1.38992]
%% Matriz b
b = [5346; -97.6824]
%% Resolução do sistema Ax = b
x = A\b
%% Determinante de A
detA = det(A)
%% Inversa de A
invA = inv(A)
% Para cálculo da inversa por EGPP - A|I -> U|J
% matriz identidade
si = size(A);
s = si(1,1);
I = eye(si);
% A | I
Ampl = [A I]
% U é a matriz triangular de Ampl
[L U] = lu(Ampl);
U
invA2 = I;
% Obtenção da inversa coluna a coluna (Ux = J_coluna_i)
for i = 1:s
    tempsol = U(:, 1:s) \ U(:, s + i);
    invA2(:,i) = tempsol;
end
%% Inversa utilizando inv(A)
invA
%% Inversa formada através de A|I -> U|J
invA2
