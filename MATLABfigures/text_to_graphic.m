[x1, y1, z1, d1, x2, y2, z2, d2] = textread('trigo30days1formatted.txt','%f %f %f %f %f %f %f %f');
couleur = [0.41 0.32 0.27];


figure(1);
grid on

for i = 1:length(x1)
      out = cylindre(x1(i), y1(i), z1(i), d1(i), x2(i), y2(i), z2(i), d2(i), couleur, 3, 1, 1);
end

view(50, 10);
axis([-19.882 20.904 -15.347 27.292 -50.373 0.0]);
pbaspect([(19.882 + 20.904) (15.347 + 27.292) 50.373])
ax = gca;
ax.XAxis.FontSize = 10;
ax.YAxis.FontSize = 10;
ax.ZAxis.FontSize = 10;
ax.XAxis.TickValues = [-19.8 -10 0 10 20.9]; 
ax.XAxis.TickLabels = {'-19.8', '-10', '0', '10', '20.9'};
ax.YAxis.TickValues = [-15.3 -10 0 10 20 27.2]; 
ax.YAxis.TickLabels = {'-15.3', '-10', '0', '10', '20', '27.2'};
ax.ZAxis.TickValues = [-50.3 -40 -30 -20 -10 0]; 
ax.ZAxis.TickLabels = {'-50.3', '-40', '-30', '-20', '-10', '0'}; 
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 20);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 20);
zlabel('$x_3$', 'Interpreter', 'latex', 'FontSize', 20);
saveas(gcf, fullfile('plots', 'trigo30days1_3D_plot'), 'epsc')
saveas(gcf, fullfile('plots', 'trigo30days1_3D_plot'), 'png')