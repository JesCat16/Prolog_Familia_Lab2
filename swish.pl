progenitor(pietro,joao).
progenitor(antonita,joao).
progenitor(pietro,clara).
progenitor(antonita,clara).
progenitor(pietro,francisco).
progenitor(antonita,francisco).
progenitor(pietro,valeria).
progenitor(antonita,valeria).
progenitor(pietro,ana).
progenitor(antonita,ana).
progenitor(ana,joao).
progenitor(ana,helena).
progenitor(joao,mario).
progenitor(helena,carlos).
progenitor(mario,carlos).
progenitor(clara, pietro2).
progenitor(clara, enzo).
progenitor(jacynto, francisca).
progenitor(claudia, francisca).
progenitor(jacynto, antonia).
progenitor(claudia, antonia).
progenitor(luzia, jacynto).
progenitor(pablo, jacynto).
casado(pietro,antonita).
casado(antonita, pietro).
casado(francisco, fabiana).
casado(fabiana, francisco).
casado(pitero2,francisca).
casado(francisca, pietro2).
casado(enzo, antonia).
casado(antonia, enzo).
casado(jacynto, claudia).
casado(claudia, jacynto).
casado(luzia, pablo).
casado(pablo, luzia).
sexo(clara,feminino).
sexo(valeria,feminino).
sexo(antonita,feminino).
sexo(ana,feminino).
sexo(helena,feminino).
sexo(joana,feminino).
sexo(fabiana,feminino).
sexo(francisca,feminino).
sexo(antonia,feminino).
sexo(claudia,feminino).
sexo(luzia,feminino).
sexo(pietro,masculino).
sexo(joao,masculino).
sexo(francisco,masculino).
sexo(mario,masculino).
sexo(carlos,masculino).
sexo(enzo,masculino).
sexo(pietro2,masculino).
sexo(jacynto,masculino).
sexo(pablo,masculino).


irma(X,Y):- progenitor(A,X),
progenitor(A,Y),
X\==Y,
sexo(X, feminino).

irmao(X,Y):- progenitor(A,X),
progenitor(A,Y),
X\==Y,
sexo(X, masculino).

avo(X,Y):- progenitor(X,A),
progenitor(A,Y),
sexo(X, masculino).

%avó
avoh(X,Y):- progenitor(X,A),
progenitor(A,Y),
sexo(X, feminino).

descendente(X,Y):- progenitor(Y,X).

descendente(X,Y):- progenitor(Y,A),
descendente(X,A).

tio(X,Y):- progenitor(A,Y),
irmao(X,A).

tio(X,Y):- progenitor(A,Y),
irma(I,A),
casado(I,X),
sexo(X, masculino).

tio(X,Y):- progenitor(A,Y),
irmao(I,A),
casado(I,X),
sexo(X, masculino).

tia(X,Y):- progenitor(A,Y),
irma(X,A).

tia(X,Y):- progenitor(A,Y),
irma(I,A),
casado(I,X),
sexo(X, feminino).

tia(X,Y):- progenitor(A,Y),
irmao(I,A),
casado(I,X),
sexo(X, feminino).

primo(X,Y):- progenitor(A,X),
tio(A,Y),
sexo(X, masculino).

primo(X,Y):- progenitor(A,X),
tia(A,Y),
sexo(X, masculino).

prima(X,Y):- progenitor(A,X),
tio(A,Y),
sexo(X, feminino).

prima(X,Y):- progenitor(A,X),
tia(A,Y),
sexo(X, feminino).


ascendente(X,Y):- descendente(Y,X).