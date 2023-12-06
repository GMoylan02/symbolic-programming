%(i)
magic(X) :- wizard(X).

%(ii)
magic(Wizard)


%(iii)
%magic(Magic).
%Magic.

%(b)
%Yes, it is an infinite dimensional list. Since the definition is recursive, X=[X], we can always stick a [X] inside the list.
%[[[[[X]]]]] and so on so the member of this list is itself an infinite dimensional list, the same list.

%(c)
%Y=[Y|Y]
%The list is a list with 2 members, the head is a list [Y|Y] and the tail is a list [Y|Y]. That is both the head and tail
%are precisely the list Y itself.

%(d)

n2bs(Num, Res) :- 
    nb(Num, [0], A), reverse(A, Res).
    
    
nb(0, Ac, Ac).
nb(succ(X), Ac, S) :-
    inc(Ac, NAc),
    nb(X, NAc, S).


inc([0|T], [1|T]).
inc([1|T], [0|N]) :- 
    inc(T, N).
inc([], [1]).
    

%Q2
member(X, [H|T]) :-  X = H; member(X, T).

%b
s(1) --> [1].
s(2) --> [2].
s(n) --> [].

s(c(A,B)) --> s(A), s(B).

s(a(_,B)) --> s(B).
s(a(A,_)) --> s(A).

s(k(_)) --> [].
s(k(X)) --> s(X), s(k(X)).


