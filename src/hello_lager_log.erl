%% @doc `lager` request log handler for `hello`.

-module(hello_lager_log).
-author('Martynas Pumputis <martynasp@gmail.com>').
-behaviour(hello_request_log).

-export([open/2, close/1, open_bad_requests/1, close_bad_requests/0, request/5,
         bad_request/5]).

-include_lib("hello/include/internal.hrl").

%% ----------------------------------------------------------------------------
%% -- Callback

open(_CallbackModule, _Owner) -> ok.

open_bad_requests(_Owner) -> ok.

close(_CallbackModule) -> ok.

close_bad_requests() -> ok.

request(CallbackModule, Handler, Endpoint, Request, Response) ->
    lager:info([{handler, CallbackModule}],
               "~s: ~p ~p~n~p~n~p~n",
               [CallbackModule, Handler, Endpoint, Request, Response]).

bad_request(CallbackModule, Handler, Endpoint, Message, Response) ->
    lager:warning([{handler, CallbackModule}],
                  "~s: ~p ~p~n~p~n~p~n",
                  [CallbackModule, Handler, Endpoint, Message, Response]).

%% ----------------------------------------------------------------------------
%% -- Helpers

