%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Feb 2019 11:19
%%%-------------------------------------------------------------------
-module(lib_misc).
-author("dennisyuan").

%% API
-export([for/3, qsort/1, pythag/1, perms/1, max/2, odds_and_evens1/1, odds_and_evens2/1,
  my_tuple_to_list/1, my_time_func/1, my_date_string/0, sqrt/1]).


for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

%% Pythagorean theorem
pythag(N) ->
  [{A, B, C} ||
    A <- lists:seq(1, N),
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].

%% Anagram
perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L -- [H])].

max(X, Y) when X > Y -> X;
max(X, Y) -> Y.

odds_and_evens1(L) ->
  Odds = [X || X <- L, (X rem 2) =:= 1],
  Evens = [X || X <- L, (X rem 2) =:= 0],
  {Odds, Evens}.

odds_and_evens2(L) ->
  odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H | Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;
odds_and_evens_acc([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.

my_tuple_to_list(T) ->
  my_tuple_to_list_acc(T, []).

my_tuple_to_list_acc({}, L) ->
  lists:reverse(L);
my_tuple_to_list_acc(T, L) ->
  Element = erlang:element(1, T),
  Tuple = erlang:delete_element(1, T),
  my_tuple_to_list_acc(Tuple, [Element | L]).

my_time_func(F) ->
  {StartMega, StartSec, StartMicro} = erlang:now(),
  F(),
  {EndMega, EndSec, EndMicro} = erlang:now(),
  {EndMega - StartMega, EndSec - StartSec, EndMicro - StartMicro}.

my_date_string() ->
  {Year, Month, Day} = erlang:date(),
  {Hour, Minute, Second} = erlang:time(),
  io:format("~w-~w-~w ~w:~w:~w~n", [Year, Month, Day, Hour, Minute, Second]).

sqrt(X) when X < 0 ->
  error({squareRootNegativeArgument, X});
sqrt(X) ->
  math:sqrt(X).