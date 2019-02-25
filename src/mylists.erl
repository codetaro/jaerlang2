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
-export([sum/1, map/2, filter/2]).


sum([H | T]) -> H + sum(T);
sum([]) -> 0.

%%map(_, []) -> [];
%%map(F, [H | T]) -> [F(H) | map(F, T)].

map(F, L) -> [F(X) || X <- L].

filter(P, [H | T]) ->
  case P(H) of
    true -> [H | filter(P, T)];
    false -> filter(P, T)
  end;
filter(P, []) ->
  [].

%%filter(P, [H | T]) -> filter1(P(H), H, P, T);
%%filter(P, []) -> [].
%%
%%filter1(true, H, P, T) -> [H | filter(P, T)];
%%filter1(false, H, P, T) -> filter(P, T).