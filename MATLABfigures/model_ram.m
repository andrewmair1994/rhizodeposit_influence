% model_ram: modele de la ramification laterale. 
% Donne la probabilité de ramification pour [ins rad] compris entre certaines valeur
function [X, Y, Z] = model_ram(STRUCT,i)
global age;
global Longueur_ramif;
global ratio_vertlat;
global ins_depart;
global incli;

n = STRUCT(i).ordre;
L = STRUCT(i).L;
coordcyl = STRUCT(i).coordcyl;
% dir = STRUCT(i).dir;
% dir = dir/norm(dir);
% incl = mod(angle( dir(3) + j*norm([dir(1) dir(2)]) ) ,pi/2);

r = sqrt(coordcyl(2)^2 + coordcyl(3)^2);


% if i==1
% radmean = 0;
% insmean  = 70;
% Lmean = 1000;
% else
% radmean = 0;
% insmean  = 70;
% Lmean = 1000;
% end
radmean = pi;
insmean = ins_depart;
%insmean = 90*pi/180;
v1 = 0.000000001;
% v2 = 0.6;
% v3 = 0.5;
v2 = 0.05;
v3 = 0.000001;
if n==1 
    %insmean = 69*pi/180;
    Lmean = Longueur_ramif/2;
    v2 = (2*pi)^2;
    v3 = 0.000001;
elseif n<3 & coordcyl(2) < 1.1  & incli<0.2
    Lmean = Longueur_ramif;
    
    rd = rand(1);
    if rd < ratio_vertlat 
       Lmean = Longueur_ramif;

        radmean = 0;
        %insmean = ins_depart;
    elseif rd > ratio_vertlat + (1-ratio_vertlat)/2
        radmean = -90*pi/180;
        insmean = 45*pi/180;
    else
        radmean = 90*pi/180;
        insmean = 45*pi/180;
    end
        
    %v2 = 0.1;
else 
    Lmean = 10000;    
end

    
   
X = abs(Lmean + sqrt(v1)*randn(1));
Y = radmean + sqrt(v2)*rand(1);
Z = insmean + sqrt(v3)*randn(1);

