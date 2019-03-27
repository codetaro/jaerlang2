%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Mar 2019 17:22
%%%-------------------------------------------------------------------
-module(count_characters).
-author("dennisyuan").

%% API
-export([count_characters/1]).


count_characters(Str) ->
  count_characters(Str, #{}).

count_characters([H | T], Map) ->
  N = maps:get(H, Map, 0),
  count_characters(T, maps:put(H, N + 1, Map));
count_characters([], Map) ->
  Map.
