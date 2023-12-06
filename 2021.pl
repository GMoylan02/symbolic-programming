membe(_, [], 0).
membe(Item, [Item|T], CountPlus1) :- 
    membe(Item, T, Count),
    CountPlus1 is Count + 1.

membe(Item, [H|T], Count) :- 
    Item \= H,
    membe(Item, T, Count).

intgr(0).
intgr(X) :- intgr(1, X).

intgr(X, X).
intgr(X, -X).
intgr(X, Y) :-
    X \== Y,
    (Z is X+1),
    intgr(Z, Y).

good([0]).
good([1,0]).
good([A,B|T]) :- good([B|T]), (B>0, A is -B ; B<0, A is -B+1).

s --> {good(L), L = [H|T]}, [H|T].

s([]) --> [].
s(X) --> s2(X, 1).
s(X) --> s2(X, 2).

s2([H|T], N) --> repeat(H, N), {T = []}.
s2([H|T], N) --> repeat(H, N), s2(T, N).
s2(X, N) --> {Z is N + 1}, s2(X, Z), !.

%Takes A and repeats it N times
repeat(_, 0) --> [].
repeat(A, N) --> [A], {Z is N - 1}, repeat(A, Z),  !.

%diff([], L, L).
diff(L, [], L).
diff([H|T], [HB|B], C) :-
    member(H,[HB|B]),
    diff(T, B, C).

diff([H|T], B, [H|C]) :- 
    not(member(H, B)),
    diff(T, B, C).





    

    
