-module(tree1).
-export([lookup/2, insert/3, write_tree/1, test/0]).

lookup(key, nil) -> 
	not_found;
lookup(key, {key, Value, _, _}) ->
	{found, Value};
lookup(Key, {Key1, _, Smaller, _}) when Key < Key1 ->
	lookup(Key, Smaller);
lookup(Key, {Key1, _, _, Bigger}) when Key > Key1 ->
	lookup(Key, Bigger).

insert(Key, Value, nil) ->
	{Key, Value, nil, nil};
insert(Key, Value, {Key, _, Smaller, Bigger}) ->
	{Key, Value, Smaller, Bigger};
insert(Key, Value, {Key1, V, Smaller, Bigger}) when Key < Key1 ->
	{Key1, V, insert(Key, Value, Smaller), Bigger};
insert(Key, Value, {Key1, V, Smaller, Bigger}) when Key > Key1 ->
	{Key1, V, Smaller, insert(Key, Value, Bigger)}.

% write_tree(T) ->
% 	write_tree(0, T).

% write_tree(D, nil) ->
% 	io:tab(D),
% 	io:format(’nil’, []);
% write_tree(D, {Key,Value,Smaller,Bigger}) ->
% 	D1 = D + 4,
% 	write_tree(D1, Bigger),
% 	io:format(’~n’, []),
% 	io:tab(D),
% 	io:format(’~w ===> ~w~n’, [Key,Value]),
% 	write_tree(D1, Smaller).

% test1() ->
% 	S1 = nil,
% 	S2 = insert(4,joe,S1),
% 	S3 = insert(12,fred,S2),
% 	S4 = insert(3,jane,S3),
% 	S5 = insert(7,kalle,S4),
% 	S6 = insert(6,thomas,S5),
% 	S7 = insert(5,rickard,S6),
% 	S8 = insert(9,susan,S7),
% 	S9 = insert(2,tobbe,S8),
% 	S10 = insert(8,dan,S9),
% 	write_tree(S10).