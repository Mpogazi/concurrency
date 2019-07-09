% Building lists functions for erl
% Not performance critical
% length, member, append, sum, product
% zip, flatten, map, equal, foldl, foldr
% pairfoldEq, concat, filter
% 
% 
-module(lists1).
-export([member/2, sum/1, push/2, map/2, fold/3, 
		 reverse/1, filter/2, append/2, product/1, 
		 zip/2,nth/2, length/1, dropwhile/2]).

member(X, [X | _]) -> true;
member(X, [_ | T]) -> member(X, T);
member(_, [])      -> false.


sum(L) -> sum(L, 0).

sum([H|T], Sum) -> sum(T, Sum + H);
sum([], Sum)    -> Sum.

push(X, [H|T]) -> [X|push(H,T)];
push(X, _)     -> [X].

map(Func, [H|T]) ->
	[Func(H) | map(Func, T)];
map(_, []) -> [].


fold(_, start, []) -> start;
fold(F, start, [H|T]) -> fold(F, F(H, start), T).


reverse(L) ->
	fold(fun(X, Acc)-> [X|Acc] end, [], L).



filter(F, L) ->
	F = fun(X, A) ->
			case F(X) of
				true  -> [X|A];
				false -> A
			end
		end,
	reverse(fold(F, [], L)).


append([H | T], tail) -> [H|append(T, tail)];
append([], tail) -> tail.

product(L) -> product(L, 1).

product([], Prod) -> Prod;
product([H|T], Prod) -> product(T, Prod * H).

zip(_, []) -> [];
zip([], _) -> [];
zip([H|L1], [I|L2]) -> [{H, I} | zip(L1, L2)].

nth(N, L) -> nth(0, N, L).

nth(Max, Max, [H|_]) -> H;
nth(N, Max, [_|T]) -> nth(N+1, Max, T).

length(L) -> length(L, 0).

length([], len)    -> len;
length([_|T], len) -> length(T, len).

dropwhile(_, [])    -> [];
dropwhile(Func, [H|T]) ->
	case Func(H) of 
		true -> dropwhile(Func, T);
		false -> [H | dropwhile(Func, T)]
	end.