% initialisation de la structure
PARAM;
nb_depart; 
dev = 0;

% initiatin ordre 1
[LONG, RAD, INS] = model_ram(APEX,1);                           % première ramif ordre 1
APEX(1).L = (1-ratio_hram1)*Zmax;
APEX(1).Vram = [RAD INS];
[LONG ANG INCL ROT] = model_fourche(APEX,1);                    % première fourche axe ordre1
APEX(1).Lfrk = [LONG ANG INCL ROT];


[APEX,AXE,ratio] = modele_ratio(APEX,AXE,1);                    % ratio
PLOG(1,7) = ratio;%0.45;

[APEX,AXE,cone] = modele_cone(APEX,AXE,1);                    % conicité
PLOG(1,8) = ratio_Pivtrc;%cone;


% départ ramifordre 2
rad = 0;
for i=2:1:nb_depart+1
    ins = ins_depart;
    rad = rad + 2*pi/nb_depart;
    [APEX, AXE] = ins_apex(APEX,AXE,rad,ins,1);
end

LLOG(1) = nb_depart + 2;

for i=1:1:nb_depart
    LLOG(i+1) = i + 2;    
end
