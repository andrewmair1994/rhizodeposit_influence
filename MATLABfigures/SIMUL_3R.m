% SIMUL 3R.  Logiciel de simulation de croissance des architectures racinanires.
% Procédure qui coordonne INterface graphique et simulateurs de croissance  CROISSANCE I, RAM, CROISSANCE II , FOURCHE

%clear;

% Contantes
global age_final;
PARAM;                                                         % fichier desparamètres 
age_final = 30;                                          % Nombre de Cycle
Volume_tot = 0.3;                                        % volume total du système racinaire
dL = 0.2;

% Structure des données
global NOEUD;
global LLOG;
global PLOG;
global act;                                                    % Type d'action (+ ou fin+)
global ordre_ramif;
global age;
global dL;

clc;
NOEUD = [0 0 0];                                               % Numero du noeud et sa position dans l'espace
AXE = struct('numero',{1},'noeudfin',{1},'noeuddebut',{1},'coordcyl',{[0 0 0]},'ordre',{1},'dv',{0},'dh',{0},'cone',{1},'dir',{[0 0 -1]},'age',{0});
APEX = struct('numero',{1},'antecedant',{0},'coordcyl',{[0 0 0]},'ordre',{1},'dv',{0},'dh',{0},'cone',{1},'dir',{[0 0 -1]},'age',{0},'L',{100},'Vram',{[0 -90]},'Lfrk',{[0 0 0 0]});

LLOG = [2];                                                    % LIgne d'insertion dans PLOG de l'APEX correspondant
       %o  a  x  y  z  dv     dh  co  e dl age
PLOG = [1  1  0  0  0  0.05  0.45  0  0  0  0];                                       % Tableau .log
ordre_log=1;
ordre_ramif=1;
act = 0;

% Structure de départ
age = 1;
INIT;

% Lancement de simulator
for t=1:1:age_final
    
    age = t;

    if rem(t,5) == 0 
        strcat('Simulation age: ', num2str(t))
    end
    % Croissance Primaire des axes
     CROISSANCEI;
    %Volume_tot = 10/age_final*t*(t/age_final)^3

end
PLOG(:,5) = -abs(PLOG(:,5));

% Etblissement du diamètres des axes. Fuasse croissance
CROISSANCEII;           


% Ecrire les fichiers
file = strcat(pwd, '\simul.txt');
dlmwrite(file,PLOG(:,1:6),'\t'); 
Graphic_log(file,1,3);
axis equal;

% dlmwrite('C:\Temp\simul.txt',PLOG,'\t'); 
% Graphic_log('C:\Temp\simul.txt',3,1);
%   file = strcat('fig',num2str(t));
%   print('-f1','-demf','-r100',file);
