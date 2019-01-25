
% Lists of possible responses
% ( Goal, response(n) )

% Return random response for goal
random_response(Goal, RandomResponse) :-
    findall(Response, response(Goal, Response), List),
    length(List, Len),
    random(0, Len, RandomNumber),
    nth0(RandomNumber, List, RandomResponse).

response(hello, 'Hi').
response(hello, 'Welcome').
response(hello, 'Good morning.').

response(bye, 'See you soon').

response(ask_location, 'Where are you?').
response(ask_location, 'Where are you standing right now?').

random_fact(RandomResponse) :-
    findall(Response, random(Response), List),
    length(List, Len),
    random(0, Len, RandomNumber),
    nth0(RandomNumber, List, RandomResponse).


random('Ignorance is bliss. -Cypher').
random('My turing test score was zero').
