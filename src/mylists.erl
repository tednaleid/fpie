-module(mylists).
-export([sum/1, sumt/1, product/1, productt/1, maximum/1, maximumt/1, double/1, doublet/1, evens/1, evenst/1]).


sum([]) ->
  0;
sum([X|Xs]) ->
  X + sum(Xs).

sumt(Xs) ->
  sumt(Xs, 0).

% tail recursive
sumt([], S) ->
  S;
sumt([X|Xs], S) ->
  sumt(Xs, X+S).


product([]) ->
  1;
product([X|Xs]) ->
  X * product(Xs).

% tail recursive
productt(Xs) ->
  productt(Xs, 1).

productt([], P) ->
  P;
productt([X|Xs], P) ->
  productt(Xs, X*P).


maximum([X]) ->
  X;
maximum([X|Xs]) ->
  maxOf(X, maximum(Xs)).

maxOf(X,Y) when X > Y ->
  X;
maxOf(_,Y) ->
  Y.



% tail recursive
maximumt([X|Xs]) ->
  maximumt(Xs, X).
maximumt([], M) ->
  M;
maximumt([X|Xs], M) when X > M ->
  maximumt(Xs, X);
maximumt([_X|Xs], M) ->
  maximumt(Xs, M).


double([X]) ->
  [X*2];
double([X|Xs]) ->
  [X*2 | double(Xs)].

doublet([]) ->
  [];
doublet([X|Xs]) ->
  doublet(Xs, [X]).

doublet([], Acc) ->
  lists:reverse(Acc);
doublet([X|Xs], Acc) ->
  doublet(Xs, [X*2 | Acc]).


evens([]) ->
  [];
evens([X|Xs]) when X rem 2 == 0 ->
  [X | evens(Xs)];
evens([_|Xs]) ->
  evens(Xs).


evenst([]) ->
  [];
evenst(Xs) ->
  evenst(Xs, []).

evenst([], Acc) ->
  lists:reverse(Acc);
evenst([X|Xs], Acc) when X rem 2 == 0 ->
  evenst(Xs, [X | Acc]);

evenst([_|Xs], Acc) ->
  evenst(Xs, Acc).
