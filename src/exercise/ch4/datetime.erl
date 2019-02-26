%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. Feb 2019 14:10
%%%-------------------------------------------------------------------
-module(datetime).
-author("dennisyuan").

%% API
-export([today/0, now/0, utcnow/0]).

%%Return the current local datetime
%%datetime.today()
today() ->
  Date = erlang:date(),
  Time = erlang:time(),
  [Date, Time].

%%Return the current local date and time
%%datetime.now()
now() -> today().

%%Return the current UTC date and time
%%datetime.utcnow()
utcnow() -> erlang:universaltime().

%%Return the local date and time corresponding to the POSIX timestamp
%%datetime.fromtimestamp(timestamp, tz=None)

%%Return the UTC datetime corresponding to the POSIX timestamp
%%datetime.utcfromtimestamp(timestamp)

%%Return the datetime corresponding to the proleptic Gregorian ordinal
%%datetime.fromordinal(ordinal)

%%Return a new datetime object whose date components are equal to the given date object’s, and whose time components and tzinfo attributes are equal to the given time object’s
%%datetime.combine(date, time)

%%Return a datetime corresponding to date_string, parsed according to format
%%datetime.strptime(date_string, format)

