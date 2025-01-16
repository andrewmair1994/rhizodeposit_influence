%  RAM: Programme qui simule la ramification laterale secondaire des axes. 
%  et qu'elle est très influencée par l'ecologie envirenementale, on a choisit un modèle STATISTIQUE SPATIAL
global incli;
global dL; 
act=1;
dincl = 90/4;
ddev = dincl;
prob = 0;
tire = 0;

%%%%%%     -     Méthode par génération d'un vecteur aléatoire donnant la position de la prochaine ramif
if APEX(count).L <= 0.1 
    Vram = APEX(count).Vram;                                                          %
    [APEX AXE] = ins_apex(APEX,AXE,Vram(1),Vram(2),count);                            %  insertion de la ramif direction Vram 
    dir = APEX(count).dir;   
    incli = angle(j*abs(dir(3)) + norm([dir(1) dir(2)]));
    [LONG RAD INS] = model_ram(APEX,count);                                          %  
    APEX(count).Vram = [RAD INS];                                                     %  tirage de la prochaine ramif
    APEX(count).L = LONG ;  
end

% autrement Tirage aléatoire L, incl et dev

