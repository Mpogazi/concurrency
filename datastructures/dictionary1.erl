-module(dictionary1).
-export([new/0, lookup/2, add/3, delete/2]).

new() -> [].

lookup(key, [{key, value} | _]) ->
	{value, value};
lookup(Key, [_ | Rest]) ->
	lookup(Key, Rest);
lookup(_, []) ->
	undefined.

add(Key, Value, Dict) ->
	NewDict = delete(Key, Dict),
	[{Key, Value} | NewDict].

delete(_, []) ->
	[];
delete(Key, [{Key, _} | Rest]) ->
	Rest;
delete(Key, [Pair | Rest]) ->
	[Pair| delete(Key, Rest)].