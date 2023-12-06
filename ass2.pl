%Q 1

%This accepts 0 since u and v are allowed to be the empty string
s --> [0].
s --> [1],s,[1].
s --> [2],s,[2].
s --> [3],s,[3].

%Q2

pet(jaguar).
pet(snail).
pet(zebra).

colour(blue).
colour(green).
colour(red).

nationality(english).
nationality(spanish).
nationality(japanese).

house(X,Y,Z) --> [h(X,Y,Z)],{colour(X),nationality(Y),pet(Z)}.

nbd --> house(X,Y,Z),house(A,B,C),house(M,N,O),
    {X\=A, X\=M, A\=M,
     Y\=B, Y\=N, B\=N,
     Z\=C, Z\=O, C\=O}.
%Q 3

%Calculates the Nth fib number
fibno(0,0) :- !.
fibno(1,1) :- !.
fibno(N, Z) :-
    N1 is N-1, 
    N2 is N-2, 
    fibno(N1, A), 
    fibno(N2, B), 
    Z is A + B.

%Wrapper for 'g' since the solution is meant to be no-arg 
fib --> g(0).

%Generates all fib numbers from N to infinity in a list
g(0) --> [0],g(1).
g(N) --> {fibno(N, Num)}, [Num].
g(N) --> {fibno(N, Num)}, [Num], {Acc is N + 1}, g(Acc).

%Q 4

accept(L) :- steps(q0,L,F), final(F).
steps(Q,[],Q).
steps(Q,[H|T],Q2) :- tran(Q,H,Qn), steps(Qn,T,Q2).

tran(q0,0,q0).
tran(q0,1,q0).
tran(q0,1,q1).
tran(q1,1,q2).
tran(q1,0,q2).
tran(q2,0,q3).
tran(q2,1,q3).
final(q3).

q0 --> [1], q1.
q0 --> [0], q0.
q0 --> [1], q0.
q1 --> [1], q2.
q1 --> [0], q2.
q2 --> [0], q3.
q2 --> [1], q3.
q3 --> [].

numeral(0).
numeral(succ(X)) :- numeral(X).

%Translates a number from succ() notation to a Numeral
getNo(succ(0), X) :- X is 1.
getNo(succ(A), Res) :- getNo(A, R1), Res is R1 + 1.
    
%If the length of some string is equal to the number provided AND this string is accepted
l3(String, A) :- getNo(A, N),length(String, N), accept(String).