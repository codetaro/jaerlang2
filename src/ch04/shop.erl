%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Feb 2019 17:23
%%%-------------------------------------------------------------------
-module(shop).
-author("dennisyuan").
-import(lists, [map/2, sum/1]).

%% API
-export([cost/1, total1/1, total2/1, total3/1]).


cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total1([{What, N} | T]) -> cost(What) * N + total1(T);
total1([]) -> 0.

total2(L) ->
  sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).

total3(L) ->
  sum([cost(What) * N || {What, N} <- L]).