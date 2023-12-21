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

n2bs(0, [0]).
n2bs(succ(0), [1]).
n2bs(succ(X), Output) :- 
    n2bs(X, LastOutput),
    incBin(LastOutput, Output), !.

incBin([0], [1]).
incBin([1], [1,0]).
incBin(Input, Output) :- 
    reverse(Input, [H|T]),
    H = 0,
    reverse([1|T], Output).
incBin(Input, Output) :- 
	reverse(Input, [H1|T1]),
    H1 = 1,
    reverse(T1, RevT1),
    incBin(RevT1, IncRevT1),
    reverse(IncRevT1, IncT1),
    reverse([0|IncT1], Output).
    

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


