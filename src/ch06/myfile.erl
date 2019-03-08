%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Mar 2019 10:57
%%%-------------------------------------------------------------------
-module(myfile).
-author("dennisyuan").

%% API
-export([read/1]).


read(Filename) ->
  try file:read_file(Filename) of
    {ok, Bin} -> Bin
  catch
    error:{error, Reason} -> throw({error, Reason})
  end.