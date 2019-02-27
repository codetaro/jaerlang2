%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Feb 2019 11:30
%%%-------------------------------------------------------------------
-module(mylists).
-author("dennisyuan").

%% API
-export([sum/1, map1/2, map2/2, filter1/2, filter2/2]).


sum([H | T]) -> H + sum(T);
sum([]) -> 0.

map1(_, []) -> [];
map1(F, [H | T]) -> [F(H) | map1(F, T)].

map2(F, L) -> [F(X) || X <- L].

filter1(P, [H | T]) ->
  case P(H) of
    true -> [H | filter1(P, T)];
    false -> filter1(P, T)
  end;
filter1(P, []) ->
  [].

%% An alternative implementation without using case
filter2(P, [H | T]) -> filter3(P(H), H, P, T);
filter2(P, []) -> [].

filter3(true, H, P, T) -> [H | filter2(P, T)];
filter3(false, H, P, T) -> filter2(P, T).