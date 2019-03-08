%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 04. Mar 2019 17:15
%%%-------------------------------------------------------------------
-module(try_test).
-author("dennisyuan").

%% API
-export([demo1/0, demo2/0, demo3/0]).


generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

demo1() ->
  [catcher(I) || I <- [1, 2, 3, 4, 5]].

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> [{N, usr, thrown, X}, {N, dev, thrown, X, erlang:get_stacktrace()}];
    exit:X -> [{N, usr, exited, X}, {N, dev, exited, X, erlang:get_stacktrace()}];
    error:X -> [{N, usr, error, X}, {N, dev, error, X, erlang:get_stacktrace()}]
  end.

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1, 2, 3, 4, 5]].

demo3() ->
  try generate_exception(5)
  catch
    error:X -> {X, erlang:get_stacktrace()}
  end.