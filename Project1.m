clear
clf

%Constants
G = 1;
M = 1;

x = [1, 2];

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
hold on;

%ORBIT 2 ========================================================

x = 2 * rad;
y = 0;
u = 0;
v = sqrt((G*M)/2 * rad);
dt = (6 * pi)/ timeSteps;
for n = 1:timeSteps
   
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    xsave(n) = x;
    ysave(n) = y;
    
    
end

plot(xsave,ysave)

%TRANSFER ORBIT =================================================
x = -rad;
y = 0;
u = 0;
dt = (pi * (3/2)^(3/2)) / timeSteps;
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
plot(xsave,ysave)

p = plot(x(1),y(1),'-o','MarkerFaceColor','red');


for k = (2:length(xsave))
    if mod(k,4) == 0
    
        p.XData = xsave(k);
        p.YData = ysave(k);
        drawnow
    end
end

function period = periodTrans(x)

   period  = (pi * (x(1) + x(2))^(3/2)) / sqrt(2 * G * M);

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