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
casal(X,Y) :- gerou(X,Z),gerou(Y,Z),!.

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
% ?- pessoa(Nome,f,Idade,_,_),Idade>20

% b)
% ?- pessoa(Nome,f,_,Altura,Peso),Altura>=1.70,Peso<65

% c)
% ?- pessoa(X,_,_,AlturaX,_),pessoa(Y,_,_,AlturaY,_),casal(X,Y),((homem(X),AlturaX>AlturaY);(homem(Y),AlturaY>AlturaX))


