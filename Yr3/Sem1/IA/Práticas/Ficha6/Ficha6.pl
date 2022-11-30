
%LICENCIATURA EM ENGENHARIA INFORMÁTICA
%MESTRADO integrado EM ENGENHARIA INFORMÁTICA

%Inteligência Artificial
%2022/23

%Draft Ficha 6


% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).
filho(paulo, carlos).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- 
    filho( N,X ),
    filho( X,A ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo( A,D ) :-
    descendente( D,A,3 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente( D,A ) :-
    filho( D,A ).
descendente( D,A ) :-
    filho(D,X),
    descendente(X,A).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente(D,A,1) :-
    filho(D,A).
descendente(D,A,N) :-
    N1 is N-1,
    filho(D,X),
    descendente(X,A,N1).
