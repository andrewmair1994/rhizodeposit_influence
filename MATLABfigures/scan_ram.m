function [x,y,z,u,v,w,diam]=scan_ram(i,a,b,c,d,e,f)
j=i;
while abs(b(j))==0 | (a(j)>2)
    j=j-1;
end

x=c(j);
y=d(j);
z=e(j);
diam = f(i);

u=c(j+1)-c(j);
v=d(j+1)-d(j);
w=e(j+1)-e(j);
