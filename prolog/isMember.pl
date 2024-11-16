/*--------------------------------< IsMember >--------------------------------*/

isMember(E, [E | _]).
isMember(E, [_ | As]) :- isMember(E, As).