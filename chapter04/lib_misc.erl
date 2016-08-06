-module(lib_misc).
-export([for/3, map/2, quicksort/1, pythag/1, permutations/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

map(F, L) -> [F(X) || X <- L].

quicksort([]) -> [];
quicksort([Pivot | T]) ->
    quicksort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    quicksort([X || X <- T, X >= Pivot]).

pythag(N) ->
    [{A, B, C} ||
         A <- lists:seq(1, N),
         B <- lists:seq(A, N),
         C <- lists:seq(B, N),
         A + B + C =< N,
         A*A + B*B =:= C*C
    ].

permutations([]) -> [[]];
permutations(L) -> [[H|T] || H <- L, T <- permutations(L -- [H])].
