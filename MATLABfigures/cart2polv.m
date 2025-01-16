% transformr Coord cartesien en polair, direct vecteur

function y = cart2polv(V)
[x1, y1, z1] = cart2pol(V(1),V(2),V(3));
y = [x1 y1 z1];