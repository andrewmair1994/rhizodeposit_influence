% Geom Beam:
% translates an architecture in the form of a .log file into a 3D graphic with the cylinder function

% EXAMPLE OF USE
%Graphic_log1('E:\MTG_code\Experimental_TXT\Pin_Maritime\couche1.txt',1,3);
function Graphic_log1(file,type,rendu)                        % type: 1 = Ramif, 2 = age, 3 = realistic
global D0;                                                    % rendu: 1 = Wired, 2 = Coarse, 3 = End, 4 = Realistic
global Zmax;                                                  %        5 = output in file    

itn=1;
fid = fopen(file,'r');

%[a b c d e f g h i j k] = textread(file,'%u %f %f %f %f %f %f %f %f %f %f');
[a b c d e f] = textread(file,'%u %f %f %f %f %f');

c=c;
d=d;
e=e+20;
f=f;%/100;
A=cat(2,a,b,c,d,e,f) ;                                                       % file type .log
RAM=[];

% variables
M1 = [];                                                                     % position of the last node
M2 = [];                                                                     % position of the new node
N1 = [];                                                                     % normal to the axis of the beam
N = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];                                          % number of the last node of order i
D = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];                                          % last diameter order i
j = 1;                                                                       % branching order
n = length(a);                                                               % number of MTG line
p  = 2;                                                                      % index of beams and nodes
noeud = [0 0 0];                                                             % position X Y Z of the node.n° row number = n° node 

global xmin ymin zmin xmax ymax zmax;
xmin = min (c);
ymin = min (d);
zmin = min (e);
xmax = max (c);
ymax = max (d);
zmax = max (e);
couleur = [0.41 0.32 0.27];
PLOG = [0 0 0 0 0 0 0 0];
% graphic options
figure(1);
grid on


%%%%%%   --- BEAMS 2 KNOTS
for i=1:n 
    if i>1
        j = a(i);     
        if b(i) == 0
            M1 = noeud(N(j),:);
            M2 = [c(i) d(i) e(i)];
            V = M2-M1;
            no = norm(V);
        end
    end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Action > %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    n1 = M1;
    if b(i) == 0
        if no == 0
            continue
        end  
        
        % couleur des axes
        if type == 1
           mxg = max(a);
           couleur = [1 (a(i)-1)/mxg 0];
       elseif type ==2
           mxg = max(k);
           couleur = [(mxg-k(i)+1)/mxg 0 1];
       else
           couleur = [0.41 0.32 0.27];
       end
            % dessin de l'axe
            if rendu == 1
                d1 = max(D(j),0.01);
                d2 = max(f(i),0.01);
            else
                d1 = max(D(j),0.01);
                d2 = max(f(i),0.01);
            end
       
       
       [x,y,z,u,v,w,diam]=scan_ram(i,a,b,c,d,e,f);
       if (a(i)==1) | (a(i)==2 & u<0 & v>0 & f(i)>2.5)  | (a(i)<5 & a(i)>2 & x<0 & y>0 & f(i)>0.2)
            out = cylindre(M1(1),M1(2),M1(3),d1,c(i),d(i),e(i),d2,couleur,rendu,a(i),b(i));   
            seg = [M1(1),M1(2),M1(3),d1,c(i),d(i),e(i),d2];
            PLOG = [PLOG;seg];
       end
       % actu variables 
       noeud = cat(1,noeud,M2);                
       D(j) = f(i);
       N(j) = p;
       p=p+1;
        

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Action + %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    else
        if i>1
            N(j) = N(j-1);
            if (a(i)==2) & ((c(i+1)-c(i))<0) & ((d(i+1)-d(i))>0 & diam>2.5)  | (a(i)<5 & a(i)>2 & c(i)<0 & d(i)>0 & diam>0.2) 
                RAM = cat(1,RAM,noeud(N(a(i)-1),:));               
            end
        end
        D(j) = f(i);
    end
end


if rendu == 4
   az = 0;
   el = 90;
   camlight(az,el);
   lighting gouraud;
   view([0 90])
end
if rendu == 5
    dlmwrite('list_segments.txt',PLOG(2:end,:),'\t'); 
end
axis equal