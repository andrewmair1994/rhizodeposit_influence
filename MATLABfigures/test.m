[x1, y1, z1, d1, x2, y2, z2, d2] = textread('segment_data_8.txt','%f %f %f %f %f %f %f %f');
couleur = [0.41 0.32 0.27];


figure(1);
grid on

for i = 1:length(x1)
      out = cylindre(x1(i), y1(i), z1(i), d1(i), x2(i), y2(i), z2(i), d2, couleur, 0, 2, 0);
end    