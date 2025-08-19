bracket(M) :- bracket(0,M).
bracket(0,[]).
bracket(N,[X|Y]) :- bracket(N1,Y), X == "(",N is N1+1, N<1.
bracket(N,[X|Y]) :- bracket(N1,Y), X == ")",N is N1-1.

addBracket(1,[]):-!.
addBracket(N,X) :- addOpenBracket(N1,[],X),addCloseBracket(N2,[],X), N is N1+N2.

addOpenBracket(0,_,[]).
addOpenBracket(N,X,Y) :-
    append(X,["("|Y],Z),
    bracket(Z),
    Y=[Y1|Y2],
    append(X,[Y1],X1),
    addOpenBracket(N1,X1,Y2),
    N is N1+1.
addOpenBracket(N,X,Y) :-
    append(X,["("|Y],Z),
    \+ bracket(Z),
    Y=[Y1|Y2],
    append(X,[Y1],X1),
    addOpenBracket(N,X1,Y2).



addCloseBracket(1,X,[]) :- append(X,[")"],Y),bracket(Y).
addCloseBracket(0,X,[]) :- append(X,[")"],Y),\+ bracket(Y).
addCloseBracket(N,X,Y) :-
    append(X,[")"|Y],Z),
    bracket(Z),
    Y=[Y1|Y2],
    append(X,[Y1],X1),
    addCloseBracket(N1,X1,Y2),
    N is N1+1.
addCloseBracket(N,X,Y) :-
    append(X,[")"|Y],Z),
    \+ bracket(Z),
    Y=[Y1|Y2],
    append(X,[Y1],X1),
    addCloseBracket(N,X1,Y2).

removeBracket(1,[]) :- !.
removeBracket(N,X) :- removeBracket(N,[],X).
removeBracket(0,_,[]).
removeBracket(N,X,[Y1|Y]) :-
    append(X,Y,Z),
    bracket(Z),
    append(X,[Y1],X1),
    removeBracket(N1,X1,Y),
    N is N1+1.

removeBracket(N,X,[Y1|Y]) :-
    append(X,Y,Z),
    \+ bracket(Z),
    append(X,[Y1],X1),
    removeBracket(N,X1,Y).

solveBracket(1,[]):-!.
solveBracket(N,B) :- addBracket(N1,B), removeBracket(N2,B), N is N1+N2,!.
