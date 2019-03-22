%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Mar 2019 14:20
%%%-------------------------------------------------------------------
-module(a).
-author("dennisyuan").
-compile(export_all).

%% API
-export([]).


start(Tag) ->
  spawn(fun() -> loop(Tag) end).

loop(Tag) ->
  sleep(),
  Val = b:x(),
% io:format("Vsn1 (~p) b:x() = ~p~n", [Tag,Val]),
% io:format("Vsn2 (~p) b:x() = ~p~n", [Tag,Val]),
  io:format("Vsn3 (~p) b:x() = ~p~n", [Tag, Val]),
  loop(Tag).

sleep() ->
  receive
  after 3000 -> true
  end.