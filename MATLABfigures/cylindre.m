% function qui ajoute un cylindre 3D au graphique
% x1=0;
% y1=0;
% z1=0;
% d1=1;
% x2=0;
% y2=0;
% z2=10;
% d2=1;
function out = cylindre(x1, y1, z1, d1, x2, y2, z2, d2,couleur,rendu,ord,act);

global xmin ymin zmin xmax ymax zmax;

if rendu == 0                                                                    %  nombre de point dans le quadrillage
elseif rendu == 1 || rendu == 5                                                                   %  nombre de point dans le quadrillage
    n=3;

elseif rendu ==2
    n=6;

elseif rendu == 3
    n=8;
else 
    n=8;

end

if rendu == 0
    p=1;
    if ord<5
        if ord<3

            p = line([x1 x2],[y1 y2],[z1 z2],'Color',[0.75 0/5 0],'LineWidth',12/ord);
            %p = line([(x1^2 + y1^2)^0.5 (x2^2 + y2^2)^0.5],[z1 z2],'Color',[0.75 0/5 0],'LineWidth',12/ord);
            %p = line([x1 x2],[y1 y2],[z1 z2],'Color',[0.75 0/5 0],'LineWidth',12/ord);
        else
            p = line([x1 x2],[y1 y2],[z1 z2],'Color',[0.75 0/5 0],'LineWidth',12/ord-1);
            %p = line([(x1^2 + y1^2)^0.5 (x2^2 + y2^2)^0.5],[z1 z2],'Color',[0.75 0/5 0],'LineWidth',12/ord-1);
            %p = line([x1 x2],[y1 y2],[z1 z2],'Color',[0.75 0/5 0],'LineWidth',12/ord-1);
        end
        
    end

elseif rendu == 1  || rendu == 5   
    %p = line([x1 x2],[y1 y2],[z1 z2],'Color',couleur,'LineWidth',d1*50);
%     ordre = num2str(ord)
%     x1
%     y1
%     z1
%     x2
%     y2
%     z2
    p = line([x1 x2],[y1 y2],[z1 z2],'Color','black','LineWidth',d1);
else
	h=sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2);                                          %  hauteur du cylindre
	
	[theta, r, z] = meshgrid(linspace(0,2*pi,n),linspace(0,d1/2,n),linspace(0,h,n));        %  maillage en coordonnée polaire
	V = r/d1*2;
	ID = ones(size(r));
	r = r.*(z/h*(d2/d1-1)+ID);        % conicité
	[x,y,z] = pol2cart(theta,r,z);                                                          %  retour coordonnées cartésiennes
	x = x + ID*x1;                                                                          %
	y = y + ID*y1;                                                                          %  Translation en M1
	z = z + ID*z1;                                                                          %
	
    
	% Dessin cone
	p = patch(isocaps(x,y,z,V,0.99999));
	
	% Rotation du cone pour le mettre dans l'axe
    V1 = [x2-x1 y2-y1 z2-z1];
    
	dir = cross([0 0 1],V1);
	center = [x1 y1 z1];
        teta1 = angle(dir(1)+dir(2)*i);
        PASS = [cos(teta1) -sin(teta1) 0;sin(teta1) cos(teta1) 0; 0 0 1];
        V2 = V1*PASS;
        
	teta = -(angle(i)-angle(V2(2) +i*V2(3)))*180/pi; 
	if teta*(teta-180)*(teta+180) ~=0
        rotate(p,dir,teta,center);
    end
	if (teta-180)*(teta+180)==0
        dir = [1 0 0];
        rotate(p,dir,180,center);
    end
	% Rendu
	set(p,'FaceColor',couleur,'EdgeColor','none','SpecularStrength',0,'DiffuseStrength',0.3);    %'AmbientLightColor',[1 1 1],
    set(gca,'AmbientLightColor',[1 1 1]);
	%a = max([abs(xmin) abs(ymin) abs(xmax) abs(ymax) abs(zmin)/2 abs(zmax)/2]);
           
end


   
out=p;
