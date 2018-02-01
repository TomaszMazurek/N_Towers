%consult('E:/polsl/PROLOG/n_towers.pl').
%do uruchomienia u�ywamy wpisuj�c interpreter: proc.
:- use_module(library(lists)).

n_towers(N, Solution) :-
%tworzy list� zmiennych
length(Solution, N),
tower(Solution, N). %wyszukuje konfiguracj� N wie�.

%zwracamy list� liczb ca�kowitych od K do N zawarte w np. up2N(1,3,X) X = [1,2,3]
up2N(N,N,[N]) :-!.
up2N(K,N,[K|Tail]) :- K < N, K1 is K+1, up2N(K1, N, Tail).


tower([],_). %�adna z pozycji wie� nie jest rozwi�zaniem dla �adnego z N problem�w.

tower([T|Tlist],N) :-

tower(Tlist, N), %najpierw rozwi�zujemy podproblem

%generujemy wszystkie mo�liwe pozycje dla wie�y
up2N(1,N,Candidate_positions_for_tower),

%wybieramy pozycj�
member(T, Candidate_positions_for_tower),

%sprawdzamy czy wie�a T jest bezpieczna
check_solution(T,Tlist).

check_solution(_,[]).

check_solution(T,[T1|Tlist]) :-
T =\= T1, %nie s� w tym samym rz�dzie
check_solution(T,Tlist).

disp([],[]).
disp([H1|T1], [H2|T2]) :- format("(~w, ~w)", [H1, H2]), disp(T1, T2).

progs :- write("podaj liczbe wierszy : "),
  read(N),
  numlist(1, N, Rows),
  n_towers(N, Solution),
  disp(Rows, Solution).