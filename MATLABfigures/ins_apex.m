% ins_apex: après RAM ou FOURCHE, il y a création de nouveau apex.
% Cette fonction Insère une nouvelle entrée dans APEX

function [x,y] = ins_apex(APEXv,AXEv,rad, ins ,k1)                                             
l = 1;                                                                              % Longueur initiale de la fourche (eviter les AXEvs longueur nulle)
ne = length([APEXv.numero]) ;                                                                % Nombre d'entrées dans APEXv
s = length([AXEv.numero]);
%global act; 
global LLOG;
global PLOG;
global NOEUD;
global ordre_ramif;
global age;
global age_final;
global dL; 
global act;
global incli


% calcul nouvelle position

%%%%%  -   REPERE RAD INS GLOBAL (notion de verticalité. XX projettée dans le plan horizontal)

dir = APEXv(k1).dir;

% if abs(dir(3))<1/sqrt(2)
%     XX = [dir(1) dir(2) 0]' / norm([dir(1) dir(2)]);                                       %
%     YY = cross([0 0 1]',XX);                                                               %   Repère local
%     ZZ = [0 0 1]';                                                                         %
% 
%     M_passage = [XX YY ZZ];                                                             %  Matrice de passage
%     V_local = [l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]' / norm([l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]);                    %  Vecteur Local
%     dir = (M_passage*V_local)';
% else
%     if abs(dir(3))<1
%         XX = [0 0 -1]';
%         YY = -cross(XX,dir) ;
%         ZZ = cross(XX,YY);
%         M_passage = [XX YY ZZ];                                                             %  Matrice de passage
%         V_local = [l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]' / norm([l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]);                    %  Vecteur Local
%         dir = (M_passage*V_local)';
%     else
%         XX = [0 0 -1]';
%         COORD = APEXv(k1).coordcyl;
%         ZZ =  [cos(COORD(1)) sin(COORD(1)) 0]'/norm([cos(COORD(1)) sin(COORD(1))]);
%         YY = cross(ZZ, XX);
%         M_passage = [XX YY ZZ];                                                             %  Matrice de passage
%         ins
%         cos(ins)
%         V_local = [l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]'/ norm([l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]);                    %  Vecteur Local
%         dir = (M_passage*V_local)';
%     end
% end
% 

%%%%%  -   REPERE RAD INS local (XX = dir)

if norm([dir(1) dir(2)])>0
    XX = [dir(1) dir(2) dir(3)]' / norm([dir(1) dir(2) dir(3)]);                                       %
    YY = cross(-[0 0 1]',XX) / norm(cross(-[0 0 1]',XX));                                                               %   Repère local
    ZZ = cross(XX,YY) / norm(cross(XX,YY));                                                                         %

    
    M_passage = [XX YY ZZ];                                                             %  Matrice de passage
    V_local = [l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]' / norm([l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]);                    %  Vecteur Local
    dir = (M_passage*V_local)';
    

else
        XX = [0 0 -1]';
        COORD = APEXv(k1).coordcyl;
        ZZ =  [cos(COORD(1)) sin(COORD(1)) 0]'/norm([cos(COORD(1)) sin(COORD(1))]);
        YY = cross(ZZ, XX);
        M_passage = [XX YY ZZ];                                                             %  Matrice de passage
        V_local = [l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]'/ norm([l*cos(ins) l*sin(ins)*sin(rad) l*sin(ins)*cos(rad)]);                    %  Vecteur Local
        dir = (M_passage*V_local)';
end



%%%%%   -  REPERE INCL DEV

% if norm([dir(1) dir(2) 0])~=0
%     XX = [dir(1) dir(2) 0]' / norm([dir(1) dir(2)]);                                       %
%     YY = cross([0 0 1]',XX);                                                               %   Repère local
%     ZZ = [0 0 1]';                                                                          %
% 
%     M_passage = [XX YY ZZ];                                                             %  Matrice de passage
%     V_local = [l*cos(incl)*cos(dev) l*cos(incl)*sin(dev) l*sin(incl)]';                    %  Vecteur Local
%     dir = (M_passage*V_local)';
% else
%     if dir(1)*dir(2)~=0
%         pos = NOEUD(APEXv(k1).numero,:);
%         
%         XX = [pos(1) pos(2) 0]';
%         YY = cross([0 0 1]',XX);                                                           
%         ZZ = [0 0 1]';                                                                         
% 
%         M_passage = [XX YY ZZ];                                                              
%         V_local = [l*cos(incl)*cos(dev) l*cos(incl)*sin(dev) l*sin(incl)]' ;                    
%         dir = (M_passage*V_local)';
%     else
%         XX = [1 0 0]';
%         YY = cross([0 0 1]',XX);                                                          
%         ZZ = [0 0 1]';                                                                         
% 
%         M_passage = [XX YY ZZ];                                                               
%         V_local = [l*cos(incl)*cos(dev) l*cos(incl)*sin(dev) l*sin(incl)]' ;                    
%         dir = (M_passage*V_local)';
%     end
% end

    
% entrée dans APEXv

numero = length(NOEUD(:,1));
ordre = ordre_ramif + 1;
position = NOEUD(numero,:);
APEXv(ne+1).numero = APEXv(k1).numero;
APEXv(ne+1).antecedant = [];
APEXv(ne+1).coordcyl = cart2polv(position);
APEXv(ne+1).ordre = ordre;
APEXv(ne+1).dv = 0;
APEXv(ne+1).dh = 0;
APEXv(ne+1).cone = 0;
APEXv(ne+1).dir = dir/norm(dir); 
APEXv(ne+1).age = 0;

incli = angle(j*abs(dir(3))*0 + norm([dir(1) dir(2)])); % ,pi/2

[LONG, RAD, INS] = model_ram(APEXv,ne+1);                                         %  
    APEXv(ne+1).Vram = [RAD INS];                                                    %  tirage de la prochaine ramif et fork
    APEXv(ne+1).L = LONG;                                                             %  pour initier les valeurl et Vram à l'apexi

 
    
    [LONG, y, z, t] = model_fourche(APEXv,ne+1);
    APEXv(ne+1).Lfrk = [LONG, y, z, t];


    % Ecriture .LOG
% act = 1;
    lign = LLOG(k1);
    % Insertion d'une ligne dans LOG
    if act ==2
        ratio = 1/sqrt(2);                     % rapport diamètre mere/diametre fille
        cone = 0;                              % décroissance du diametre si croissance sans ramif
        e = 1;                                 % facteur d'ovalite de la section
        LIGNE = [ordre 1 position(1) position(2) position(3) 0.05 ratio cone e 0 age_final-age+1];
    else
        [APEXv,AXEv,ratio] = modele_ratio(APEXv,AXEv,i);                     % rapport diamètre mere/diametre fille
        cone = 1;                              % décroissance du diametre si croissance sans ramif
        e = 1;                                 % facteur d'ovalite de la section
        LIGNE = [ordre 1 position(1) position(2) position(3) 0.05 ratio cone e 0 age_final-age+1];
    end     
        
    PLOG = ins_log(PLOG,LIGNE,lign);
    
    % nouveau LLOG    
    LLOG = cat(1,LLOG,lign);
    LLOG = LLOG + step(LLOG,lign);              % ici, le nouvel apex crée (n+1 eme), insere des lignes dans le PLOG,
                                                % au m^eme endroit que le k1 eme. mais comme change_apex ensuite, passera d'abord  
                                                % par k1 et décalera LLOG(k1) en premier sans toucher LLOG(n+1) 
                                                % (ramif ordre+1 qui insere au meme endroit) :   
                                                % 
                                                % LLOG = LLOG + step(LLOG,lign+1);
                                                % LLOG(k1) = lign + 1;
    
    
    
x = APEXv;
y = AXEv;