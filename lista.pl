% QUESTÃO 1
% a)
% pai(Pai, Filho(a))
pai(ivo,eva).
pai(raí,noé).
pai(ary,gal).
pai(gil,raí).
pai(gil,clô).
pai(gil,ary).

% mae(Mae, Filho(a))
mae(ana,eva).
mae(eva,noé).
mae(lia,gal).
mae(bia,raí).
mae(bia,clô).
mae(bia,ary).

% b)
homem(ivo).
homem(gil).
homem(raí).
homem(ary).
homem(noé).

mulher(ana).
mulher(bia).
mulher(eva).
mulher(clô).
mulher(lia).
mulher(gal).

% c)
% gerou(Pai/Mae, Filho(a))
gerou(X,Y) :- pai(X,Y);mae(X,Y).

% d)
% filho(Filho, Pai/Mae)
filho(X,Y) :- homem(X), gerou(Y,X).

% filho(Filha, Pai/Mae)
filha(X,Y) :- mulher(X), gerou(Y,X).

% irmao(Filho(a),Filho(a))
irmao(X,Y) :- pai(Z,X),pai(Z,Y),mae(G,X),mae(G,Y),Y\=X.

% tio(Tio, Sobrinho(a))
tio(X,Y) :- homem(X),((pai(Z,Y),irmao(Z,X));(mae(Z,Y),irmao(Z,X))).

% tia(Tia, Sobrinho(a))
tia(X,Y) :- mulher(X),((pai(Z,Y),irmao(Z,X));(mae(Z,Y),irmao(Z,X))).

% primo(Primo, Prima(o))
primo(X,Y) :- homem(X), ((pai(Z,X),tio(Z,Y));(mae(Z,X),tia(Z,Y))).

% prima(Prima, Prima(o))
prima(X,Y) :- mulher(X), ((pai(Z,X),tio(Z,Y));(mae(Z,X),tia(Z,Y))).

% avô(Avô, neta(o))
avô(X,Y) :- homem(X), pai(X,Z), (pai(Z,Y);mae(Z,Y)).

% avó(Avô, neta(o))
avó(X,Y) :- mulher(X), mae(X,Z), (pai(Z,Y);mae(Z,Y)).

% QUESTÃO 2
% a)
% feliz(Pessoa)
feliz(X) :- pai(X,_);mae(X,_).

% b)
% casal(Pessoa 1, Pessoa 2)
casal(X,Y) :- gerou(X,Z), gerou(Y,Z), X \= Y.

% QUESTÃO 3
% país(Nome, Área, População)
país(brasil, 9, 130).
país(china, 12, 1800).
país(eua, 9, 230).
país(índia, 3, 450).

% a)
% densidade(País,Densidade)
densidade(P,D) :- país(P, Ar, Pop), D is Pop/Ar.

% b)
% maisPopuloso(País1,Pais2)
maisPopuloso(P1,P2) :- país(P1, _, Pop1), país(P2, _, Pop2), Pop1>Pop2.

% QUESTÃO 4
pessoa(ana, f, 23, 1.55, 56.0).
pessoa(bia, f, 19, 1.71, 61.3).
pessoa(ivo, m, 22, 1.80, 70.5).
pessoa(lia, f, 17, 1.85, 57.3).
pessoa(eva, f, 28, 1.75, 68.7).
pessoa(ary, m, 25, 1.72, 68.9).

% a)
% ?- pessoa(Nome,f,Idade,_,_),Idade>20.

% b)
% ?- pessoa(Nome,_,_,Altura,Peso),Altura>=1.70,Peso<65.

% c)
% ?- pessoa(X,m,_,AlturaX,_),pessoa(Y,f,_,AlturaY,_),casal(X,Y),(AlturaX>AlturaY).

% QUESTÃO 5
joga(ana,volei).
joga(bia,tenis).
joga(ivo,basquete).
joga(eva,volei).
joga(leo,tenis).

% a) ?- joga(P,X), joga(leo,X), P\=leo.

% 1 ?- trace,joga(P,X), joga(leo,X), P\=leo.
%    Call: (11) joga(_6406, _6408) ? creep
%    Exit: (11) joga(ana, volei) ? creep
%    Call: (11) joga(leo, volei) ? creep
%    Fail: (11) joga(leo, volei) ? creep
%    Redo: (11) joga(_6406, _6408) ? creep
%    Exit: (11) joga(bia, tenis) ? creep
%    Call: (11) joga(leo, tenis) ? creep
%    Exit: (11) joga(leo, tenis) ? creep
%    Call: (11) bia\=leo ? creep
%    Exit: (11) bia\=leo ? creep
% P = bia,
% X = tenis ;
%    Redo: (11) joga(_6406, _6408) ? creep
%    Exit: (11) joga(ivo, basquete) ? creep
%    Call: (11) joga(leo, basquete) ? creep
%    Fail: (11) joga(leo, basquete) ? creep
%    Redo: (11) joga(_6406, _6408) ? creep
%    Exit: (11) joga(eva, volei) ? creep
%    Call: (11) joga(leo, volei) ? creep
%    Fail: (11) joga(leo, volei) ? creep
%    Redo: (11) joga(_6406, _6408) ? creep
%    Exit: (11) joga(leo, tenis) ? creep
%    Call: (11) joga(leo, tenis) ? creep
%    Exit: (11) joga(leo, tenis) ? creep
%    Call: (11) leo\=leo ? creep
%    Fail: (11) leo\=leo ? creep
% false.

% b) ?- joga(leo,X), joga(P,X), P\=leo.

% [trace] 2 ?- trace, joga(leo,X), joga(P,X), P\=leo.
%    Call: (11) joga(leo, _218) ? creep
%    Exit: (11) joga(leo, tenis) ? creep
%    Call: (11) joga(_222, tenis) ? creep
%    Exit: (11) joga(bia, tenis) ? creep
%    Call: (11) bia\=leo ? creep
%    Exit: (11) bia\=leo ? creep
% X = tenis,
% P = bia ;
%    Redo: (11) joga(_222, tenis) ? creep
%    Exit: (11) joga(leo, tenis) ? creep
%    Call: (11) leo\=leo ? creep
%    Fail: (11) leo\=leo ? creep
% false.

% Explicação: Na chama consulta da letra A ele 
% consulta todos os pessoas e seus respectivos esportes
% e compara com o leo o que é muito mais custo do que a
% segunda consulta que já começa com o esporte de leo o
% que faz com que ele procure apenas pessoas que jogam
% o esporte de leo o que é muito mais rápido, fato que
% pode ser percebido na árvore.

% QUESTÃO 6
num(N,positivo) :- N>0,!.
num(0,nulo) :- !.
num(N,negativo) :- N<0.

% QUESTÃO 7
mult(_,0,0). % Base
mult(X,Y,P_atual) :- Y>0, M is Y-1, mult(X,M,P_ant), P_atual is X+P_ant. % Passo

% QUESTÃO 8
bin(Num, Res) :- Num < 2, Res is Num. % Base
bin(N, R) :- N >= 2, Temp is mod(N,2), bin(N//2, R_antes), R is (R_antes*10)+Temp. % Passo

% QUESTÃO 9
% a)
estrada(a,b,25).
estrada(a,d,23).

estrada(b,c,19).
estrada(b,e,32).

estrada(c,d,14).
estrada(c,f,28).

estrada(d,f,30).

estrada(e,f,26).

% b)
dist(Origem,Destino,Dist) :- estrada(Origem, Destino, Dist);estrada(Origem, Caminho, D1), dist(Caminho, Destino, D2), Caminho \= Destino, Dist is D1+D2.

% c)
rota(Origem, Destino, [Origem, Destino]) :- estrada(Origem, Destino, _).
rota(Origem, Destino, [Origem | RestoRota]) :- estrada(Origem, Caminho, _), rota(Caminho, Destino, RestoRota).

% QUESTÃO 10 
ultimo([H|[]],H).
ultimo([_|T],U) :- ultimo(T, U).

% QUESTÃO 11
max([H|[]],H).
max([H|T],U) :- max(T, A), ((H >= A, U is H);(A > H, U is A)).

% QUESTÃO 12
anexa([],R,R).
anexa([H|T],L2, [H|L]) :- anexa(T,L2,L).

% QUESTÃO 13
inv([], []).
inv([H|T], R) :- inv(T, CaudaInvertida), anexa(CaudaInvertida, [H], R).

% QUESTÃO 14


% QUESTÃO 15