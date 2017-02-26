-module(second).
-export([hypotenuse/2, perimeter/2]).

hypotenuse(W,H) ->
  math:sqrt(first:square(W) + first:square(H)).

perimeter(W,H) ->
  W + H + hypotenuse(W,H).