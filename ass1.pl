add5(0,0,0).
add5(0,X,Z):- add5(X,0,Z).
add5(-W, Y, Z) :- minus(W,X), add5(X,Y,Z).
add5(W,-Y,Z) :- minus(Y,X),add5(W,X,Z).

add5(s(p(X)),Y,Z) :- add5(X,Y,Z).
add5(p(s(X)),Y,Z) :- add5(X,Y,Z).

add5(s(X),p(Y),Z):- add5(X,Y,Z).
add5(p(X),s(Y),Z) :- add5(X,Y,Z).

add5(s(X), Y, s(Z)) :- add5(X,Y,Z).
add5(s(X+W),Y,s(Z)) :- add5(X+W,Y,Z).
add5(X+W,Y,Z):- add5(X,W,A),add5(A,Y,Z).
add5(s(X+W),Y,s(Z)) :- add5(X,Y+W,Z).
add5(X-Y,W,Z) :- add5(X,-Y,V), add5(V,W,Z).

add5(s(X-W), Y, s(Z)) :- add5(X-W, Y, Z).

%add5(-p(s(X)), Y, Z) :- add5(W,Y,Z), minus(W,X).
%add5(-s(p(X)), Y, Z) :- add5(W,Y,Z), minus(W,X).

add5(p(X),Y,p(Z)) :- add5(X,Y,Z).

add5(p(X)+s(W),Y,Z):- add5(X+W,Y,Z).
add5(X, Y, p(s(Z))) :- add5(X,Y,Z).
minus(0,0).
minus(X,0) :- X = 0 .
%minus(-X,-minus(X,X)).
minus(s(p(X)),Z) :- minus(X,Z).
minus(p(s(X)),Z) :- minus(X,Z).
minus(p(X),s(Z)):- minus(X,Z).
minus(s(X),p(Z)):- minus(X,Z).
minus(X-Y,Z) :- add5(-X,Y,Z).

subtract2(0,0,0).
subtract2(X,-Y, Z) :- add5(X,Y,Z).
subtract2(X,Y, Z) :- add5(X,-Y,Z).


