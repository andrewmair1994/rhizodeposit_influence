%  ins_log: Insere une ligne dans le point log à une place donnée
function y = ins_log(MAT,VECT,i);
n = length(MAT(:,1));
i;
MAT;
VECT;
if n>1
%     if length(MAT(1,:))>1;
%         VECT
%     end
    P1 = MAT(1:1:i-1,:);
    P2 = MAT(i:1:n,:);
    P1 = cat(1,P1,VECT);
    y = cat(1,P1,P2);
else
    y = cat(1,MAT,VECT);
end
