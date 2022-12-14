%aluno
aluno(1,joao,m).
aluno(2,antonio,m).
aluno(3,carlos,m).
aluno(4,luisa,f).
aluno(5,maria,f).
aluno(6,isabel,f).

curso(1,lei).
curso(2,miei).
curso(3,lcc).

%disciplina(cod,sigla,ano,curso)
disciplina(1,ed,2,1).
disciplina(2,ia,3,1).
disciplina(3,fp,1,2).

%inscrito(aluno,disciplina)
inscrito(1,1).
inscrito(1,2).
inscrito(5,3).
inscrito(5,5).
inscrito(2,5).

%nota(aluno,disciplina,nota)
nota(1,1,15).
nota(1,2,16).
nota(1,5,20).
nota(2,5,10).
nota(3,5,8).

%copia
copia(1,2).
copia(2,3).
copia(3,4).

%-- Os alunos que nao estao inscritos em qualquer disciplina alinea i)
ninscritos(Aluno) :- aluno(Numero,Aluno,_), not(inscrito(Numero,_)).

naoinscrito(L) :- findall(Aluno, ninscritos(Aluno), L).

% -- alinea ii)

concatenar([],L2,L2).
concatenar( [X|R], L2, [X|L]) :- concatenar(R,L2,L).

disciplinaNaoExiste(Aluno) :-
    aluno(Numero, Aluno, _),
    inscrito(Numero, D),
    not(disciplina(D,_,_,_)).

notinscrito2(S) :-
    findall(Aluno, disciplinaNaoExiste(Aluno), L),
    naoinscrito(R),
    concatenar(L, R, S).

% -- alinea iii)

tamL([_],1) :- !.
tamL([_|L],T :- tamL(L,X), T is X+1.

somaL([], 0).
somaL([H|T],S) :- soma(T,X), S = H + X.

media(Aluno,M) :-
    aluno(Numero,Aluno,_),
    findall(N, nota(Numero,_,N),Ls),
    mediaA(Ls,M).

% -- alinea iv)

lista_acima_media(M,R) :- findall(Aluno, (media(Aluno,MediaA), MediaA > M),R).

acimamedia(Aluno) :-
    findall(N,nota(_,_,N),L),
    mediaA(L,M),
    lista_acima_media(M,Aluno).

% -- alinea v)

copiou(Aluno) :- aluno(Numero,Aluno,_), copia(Numero,_).

copiaram(X) :- findall(N, copiou(N), X).
