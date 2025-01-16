function [x,y,cone] = modele_cone(APEXX,AXX,i)
K=4;                                                % conicité pour R=0
tho = 2;                                            % pente à l'ogine de la conicité
global dL;
global grad_cone;


coord = AXX(i).coordcyl;
ordre = AXX(i).ordre;
r = coord(2);
%cone=0.15;
if ordre == 1
    %cone=0;
    cone=0.15;
else
    cone = grad_cone*(100*(r))^-0.619;
end

AXX(i).cone = cone;

x = APEXX;
y = AXX;
