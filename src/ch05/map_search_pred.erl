%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2019 20:08
%%%-------------------------------------------------------------------
-module(map_search_pred).
-author("dennisyuan").

%% API
-export([map_search_pred/2]).


map_search_pred(Map, Pred) ->
  L = maps:to_list(Map),
  [H | T] = [{K, V} || {K, V} <- L, Pred(K, V)],
  H.
