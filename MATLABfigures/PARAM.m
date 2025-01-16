% A T T E N T I O N : faire un minimum de cycles et dL petit pour que la profondeur soit plus exacte. 
% Déclaration
global dL;
global Longueur_ramif;
global Longueur_fourche;
global ins_depart;
global ratio_vertlat;
global ratio_Pivtrc;
global Rmax;
global Zmax;
global grad_cone;
global ratio_hram1;
%%%%% Paramètres genéraux
Rmax = 3;                                           % eloignement maximal autorisé. ensuite, mort de l'apex
                                                    % MAX DISTANCE FROM tHE TRUNK

%[prmt] = textread('PARAM.txt','%f');

%%%%%   -   Paramètres plan expérience
nb_depart = 4; %prmt(1); %4;                        % nombre de racines charpentières
                                                    % NUMBER OF ROOTS AT THE COLLAR

ins_depart = 90*pi/180; %prmt(2)* pi/180;           % inclinaison des racins au collet
                                                    % INCLINATION ANGLE OF ROOTS AT START
                                                    
Zmax = 1.0; %prmt(3); %1;                             % profondeur maximal avant mort de l'apex
                                                    % MAX DEPTH
Longueur_ramif = 0.3; %prmt(4); %0.3;               % DISTANCE BETWEEN LATERALS

Longueur_fourche = 8; %prmt(5); %1;                 % Ratio longueur apparition forche / distance arr^et des racines
                                                    % DISTANCE BEFORE FORKS APPEARS

ratio_vertlat= 0.72; %prmt(6); %0.9;                % ratio nombre latérales / verticales
                                                    % HORIZONTAL / VERTICAL RATIO

                                                     
ratio_Pivtrc= 0.6; %prmt(7); %0.5;                  % ratio du diamètre du pivot / diam tronc
                                                    % DIAMETER RATIO TAP - TRUNK

grad_cone = 0.0;%prmt(8); %0.8;                     % joue sur la diminution du de la conicité avec la distance au collet
                                                    % TAPER

ratio_hram1 = 0.0;%prmt(9); %0.0;                  % ratio de la profondeur ou débute les ramifs sur le pivot/profondeur totale
                                                   % RATIO TAP/TOTAL DEPTH WHERE LATERALS EMERGES

% nb_depart = 1;                                          % nombre de racines charpentières
% ins_depart = 90 * pi/180;                                % inclinaison des racins au collet
% Zmax = 0.8;                                          % profondeur maximal avant mort de l'apex
% Longueur_ramif = 0.32;
% Longueur_fourche = 0.48;                                    % Ratio longueur apparition forche / distance arr^et des racines
% ratio_vertlat= 0.99;                                     % ratio nombre latérales / verticales
% ratio_Pivtrc= 1;                                       % ratio du diamètre du pivot / diam tronc
% 
% grad_cone = 0.8;                                        % joue sur la diminution du de la conicité avec la distance au collet
% ratio_hram1 = 10;                                       % ratio de la profondeur ou débute les ramifs sur le pivot/profondeur totale
% 
%4.0000   90.0000    0.8000    0.3200    0.4800    0.8400    0.6400    1.0000    0.9600