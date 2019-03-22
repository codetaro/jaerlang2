%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Mar 2019 15:58
%%%-------------------------------------------------------------------
-module(ex07).
-author("dennisyuan").

%% API
-export([reverse_bytes/1, term_to_packet/1, packet_to_term/1, test/0, negation/1]).


reverse_bytes(Bin) ->
  R = lists:reverse([X || <<X:1>> <= Bin]),
  <<<<X>> || X <- R>>.

term_to_packet(Term) ->
  <<N:4/bytes, Data/bytes>> = term_to_binary(Term),
  {N, Data}.

packet_to_term(Packet) ->
  <<_N:4/bytes, Data/bytes>> = Packet,
  Data.

test() ->
  {N, <<"you are empty">>} = term_to_packet("you are empty"),
  <<"you are empty">> = packet_to_term(list_to_binary([N, <<"you are empty">>])),
  tests_worked.

negation(Bin) ->
  <<<<(X bxor 1)>> || <<X:1>> <= Bin>>.