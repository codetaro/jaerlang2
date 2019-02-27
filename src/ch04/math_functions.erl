%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Feb 2019 17:07
%%%-------------------------------------------------------------------
-module(math_functions).
-author("dennisyuan").

%% API
-export([even/1, odd/1, filter/2, split1/1, split2/1, test/0]).


even(X) ->
  (X rem 2) =:= 0.

odd(X) ->
  (X rem 2) =:= 1.

filter(F, L) ->
  [X || X <- L, F(X)].

split1(L) ->
  split_acc(L, [], []).

split_acc([], Odds, Evens) -> {lists:reverse(Odds), lists:reverse(Evens)};
split_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> split_acc(T, [H | Odds], Evens);
    0 -> split_acc(T, Odds, [H | Evens])
  end.

split2(L) ->
  Even = filter(fun(X) -> even(X) end, L),
  Odd = filter(fun(X) -> odd(X) end, L),
  {Even, Odd}.

test() ->
  true = even(0),
  false = even(1),
  true = odd(3),
  false = odd(2),
  test_passed.