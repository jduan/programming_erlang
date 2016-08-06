-module(shop).
-export([cost/1, total/1, total2/1, total3/1]).

cost(oranges)   -> 5;
cost(newspaper) -> 8;
cost(apples)    -> 2;
cost(pears)     -> 9;
cost(milk)      -> 7.

% recursive call
total([{What, Quantity} | Rest]) -> cost(What) * Quantity + total(Rest);
total([]) -> 0.

% use lists functions
total2(L) ->
    lists:sum(lists:map(fun({What, Quantity}) -> cost(What) * Quantity end, L)).

% use list comprehension
total3(L) ->
    lists:sum([cost(What) * Quantity || {What, Quantity} <- L]).

%% Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}].
