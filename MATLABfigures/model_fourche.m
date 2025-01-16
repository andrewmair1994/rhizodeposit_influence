% model_ram: modele de la fabrication des fourches. 
% Donne la probabilité de ramification en un point donné
function [x, y, z, t] = model_fourche(STRUCT,i)
global Longueur_fourche;
global Zmax;
global Rmax;
n = STRUCT(i).ordre;
coord = STRUCT(i).coordcyl;
dir = STRUCT(i).dir;
%dir = dir/norm(dir);

incl = angle(dir(3)*j +norm([dir(1) dir(2)]));
%Leq =(Rmax + (abs(incl)*2/pi)^10*(Zmax-Rmax));
%Leq =Zmax + (pi/2-abs(incl))*2/pi*(Rmax-Zmax);
if n==2
    Leq = Rmax;
elseif n>2 & coord(2)>1.2
    Leq = Rmax;
else
    Leq = Zmax;
end

s1 = 0.00001;
s2 = 0.00005;
s3 = 0.0001;
ang = 45 * pi/180;
rot = 0 * pi/180;
incl = 0 * pi/180;                                              % représente en fait la variation d'angle d'inclinaison dans  le repère polaire

if n==1
    Lmoy = Longueur_fourche*Zmax/Rmax;
    ang = 120*pi/180;

elseif n==2
    Lmoy = Longueur_fourche;        %sans Leq
elseif n==3 
    Lmoy = Longueur_fourche;
else
    Lmoy = 1000;
end


x = abs(Lmoy + sqrt(0.000001)*randn(1));
y = ang + sqrt(s1)*randn(1);
z = rot + sqrt(s2)*randn(1);
t = incl + sqrt(s3)*randn(1)*sign(randn(1));              % INUTILISE
