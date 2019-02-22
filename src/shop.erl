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

%% API
-export([cost/1, total/1]).


cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total([{What, N} | T]) -> cost(What) * N + total(T);
total([]) -> 0.