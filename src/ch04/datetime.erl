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
-import(calendar, [datetime_to_gregorian_seconds/1]).

%% API
-export([today/0, now/0, utcnow/0, fromtimestamp/2, utcfromtimestamp/1,
  fromordinal/1, combine/2]).


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
fromtimestamp(TimeStamp, TimeZone) ->
  BaseSec = calendar:datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}}),
  Seconds = BaseSec + TimeStamp + TimeZone * 3600,
  calendar:gregorian_seconds_to_datetime(Seconds).

%%Return the UTC datetime corresponding to the POSIX timestamp
%%datetime.utcfromtimestamp(timestamp)
utcfromtimestamp(TimeStamp) -> fromtimestamp(TimeStamp, 0).

%%Return the datetime corresponding to the proleptic Gregorian ordinal
%%datetime.fromordinal(ordinal)
fromordinal(Ordinal) -> calendar:gregorian_days_to_date(Ordinal).

%%Return a new datetime object whose date components are equal to the given date object’s, and whose time components and tzinfo attributes are equal to the given time object’s
%%datetime.combine(date, time)
combine(Date, Time) -> {Date, Time}.

%%Return a datetime corresponding to date_string, parsed according to format
%%datetime.strptime(date_string, format)