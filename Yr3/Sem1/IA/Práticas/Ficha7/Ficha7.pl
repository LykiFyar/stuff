%LICENCIATURA EM ENGENHARIA INFORMÃTICA
%MESTRADO integrado EM ENGENHARIA INFORMÃTICA

%InteligÃªncia Artificial
%2022/23

%Draft Ficha 7


% Parte I
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}

soma( X,Y,Z,Soma ) :-
    Soma is X+Y+Z.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado somaL: L ,Soma -> {V,F}

somaL([], 0).
somaL([X|L], R) :-
    somaL(L,R1),
    R is X + R1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: X,Y,R -> {V,F}

maior(X,Y,X) :- X > Y.
maior(X,Y,Y) :- X <= Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Lista, M, Resultado -> {V,}

maiorL([X], X).
maiorL([H|L], Resultado) :- 
    maiorL(L, R1),
    maior(H,R1,Resultado).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quantidade de elementos de uma lista.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Tamanho de uma Lista


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Média aritmética de uma lista



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% verificar se um numero é par




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado impar: N -> {V,F}


% Parte II--------------------------------------------------------- - - - - -



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}

comprimento([], 0).
comprimento([H|T], N1) :- 
    comprimento(T,N),
    N1 is N + 1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado quantos: Lista,Comprimento -> {V,F}

quantos([],0).
quantos([H|T], N) :-
    pertence(H,T),
    quantos(T,N).
quantos([H|T], N1) :-
    nao( pertence(H,T)),
    quantos(T,N), N1 is N + 1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagar: Elemento,Lista,Resultado -> {V,F}

apagar(X,[X|L],L).
apagar(X,[H|T],[H|L]) :-
    X \= Y,
    apagar(X,T,L).
          
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagatudo: Elemento,Lista,Resultado -> {V,F}

apagatudo(X,[],[])..
apagatudo(X, [X|R],L) :-
    apagatudo(X,R,L).
apagatudo(X, [Y|R], [Y|L]) :-
    X \= Y,
    apagatudo(X,R,L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado adicionar: Elemento,Lista,Resultado -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: Lista1,Lista2,Resultado -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado inverter: Lista,Resultado -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}
