%  This is a program about who likes what kinds of food.
likes(john,pizza).                   % John likes pizza.
likes(john,sushi).                   % John likes sushi.
likes(mary,sushi).                   % Mary likes sushi.
likes(paul,X) :- likes(john,X).      % Paul likes what John likes.
likes(X,icecream).                   % Everybody likes ice cream.

