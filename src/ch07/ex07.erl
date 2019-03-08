%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Mar 2019 12:21
%%%-------------------------------------------------------------------
-module(ex07).
-author("dennisyuan").

%% API
-export([reverse_bin/1, term_to_packet/1]).


reverse_bin(Bin) ->
  L = [X || <<X:1>> <= Bin],
  R = lists:reverse(L),
  list_to_binary(R).

term_to_packet(Term) ->
  <<Size:4, Data:Size/binary>> = term_to_binary(Term),
  {Size, Data}.