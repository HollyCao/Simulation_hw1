clear
clf

%Constants
G = 1;
M = 1;


%Variables
rad = 1;
t = 0.0;
tf = 2 * pi;
timeSteps = 1000;
dt = (2 * pi)/ timeSteps;

xsave = zeros(1, timeSteps);
ysave = zeros(1, timeSteps);

%ORBIT 1 ======================================================
x = rad;
y = 0;
u = 0;
v = sqrt((G*M)/rad);

for n = 1:timeSteps
   
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    xsave(n) = x;
    ysave(n) = y;
    %plot(x,y, '-b',xsave(n),ysave(n))
    
    
    %axis equal
    %axis ([-2, 2, -2, 2])
    %drawnow
    
end

plot(0,0, 'r*',xsave,ysave)
axis equal
axis([-2, 2, -2, 2])
hold on;

%ORBIT 2 ========================================================

x = 2 * rad;
y = 0;
u = 0;
v = sqrt((G*M)/(2 * rad));
dt = (5.673 * pi)/ timeSteps;

xsave1 = zeros(1, timeSteps);
ysave1 = zeros(1, timeSteps);
for n = 1:timeSteps
   
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    xsave1(n) = x;
    ysave1(n) = y;
    
    
end
plot(xsave1, ysave1)
outer = plot(xsave1(1),ysave1(1), '-o','MarkerFaceColor','red');

%TRANSFER ORBIT =================================================
x = -rad;
y = 0;
u = 0;
dt = periodTrans([1, 2], G, M) / timeSteps;
v = -(sqrt((G*M)/rad) + (sqrt(4/3)-1));
for n = 1:timeSteps
   
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    xsave(n) = x;
    ysave(n) = y;
    
    
end
%plot(xsave,ysave)

p = plot(x(1),y(1),'-o','MarkerFaceColor','red');
hold on
trail = plot(x(1), y(1), 'blue');


for k = (2:length(xsave))
    if mod(k,4) == 0
    
        p.XData = xsave(k);
        p.YData = ysave(k);
        trail.XData = xsave(1:k);
        trail.YData = ysave(1:k);
        outer.XData = xsave1(k);
        outer.YData = ysave1(k);
        drawnow
    end
end


%{
x = rad;
y = 0;
u = 0;
dt = (pi * (3/2)^(3/2)) / 100;
v = sqrt((G*M)/rad) + (sqrt(4/3)-1);
for n = 1:100
   
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    xsave(n) = x;
    ysave(n) = y;
    
    
    scatter(xsave(n),ysave(n))
    drawnow
    
end
%}