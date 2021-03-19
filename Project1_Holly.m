clear

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
figure1 = figure(1);

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
plot(xsave1, ysave1)   %outer trail
outer = plot(xsave1(1),ysave1(1), '-o','MarkerFaceColor','red');    %outer satellite
figure2 = figure(2);
velocity = plot(0, 0,'-+','MarkerSize',20);
figure3 = figure(3);
acceleration = plot(0,0,'-*','MarkerSize',20);
figure(1);

%TRANSFER ORBIT =================================================
x = -rad;
y = 0;
u = 0;
dt = periodTrans([1, 2], G, M) / timeSteps;
v = -(sqrt((G*M)/rad) + (sqrt(4/3)-1));



usave = zeros(1,timeSteps); %velocity
vsave = zeros(1,timeSteps);
axsave = zeros(1,timeSteps);    %acceleration
aysave = zeros(1,timeSteps);

for n = 1:timeSteps
   
    r = sqrt(x^2 + y^2);
    
    ax = - dt*G*M * x/r^3;
    ay = - dt*G*M * y/r^3;
    u = u + ax;
    v = v + ay;
    x = x + dt*u;
    y = y + dt*v;
    
    xsave(n) = x;
    ysave(n) = y;
    usave(n) = u;
    vsave(n) = v;
    axsave(n) = ax;
    aysave(n) = ay;
    
end
%plot(xsave,ysave)

p = plot(x(1),y(1),'-o','MarkerFaceColor','red');
hold on
trail = plot(x(1), y(1), 'blue');


for k = (2:length(xsave))
    if mod(k,4) == 0
        figure(1);
        p.XData = xsave(k);
        p.YData = ysave(k);
        trail.XData = xsave(1:k);
        trail.YData = ysave(1:k);
        outer.XData = xsave1(k);
        outer.YData = ysave1(k);
        
       
        figure(2);
        
        velocity.XData = usave(k);
        velocity.YData = vsave(k);
        velocity.YData = usave(k);
        velocity.XData = vsave(k);
        axis([-2,2,-2,2]);
        %legend("velocity")
        
        figure(3);
        
        acceleration.XData = axsave(k);
        acceleration.YData = aysave(k);
        axis([-0.01,0.01,-0.01, 0.01]);
        %legend("acceleration")
        drawnow
    end
end

figure(2);
plot(usave, vsave);
axis([-2,2,-2,2]);
legend("velocity");
figure(3);
plot(axsave, aysave);
axis([-0.01,0.01,-0.01, 0.01]);
legend("acceleration");


time = linspace(0, 2*pi, timeSteps);
figure4 = figure(4);
plot(time,usave);
legend("x velocity");

figure5 = figure(5);
plot(time,vsave);
legend("y velocity");

figure6 = figure(6);
plot(time,axsave);
legend("x acceleration");

figure7 = figure(7);
plot(time, aysave);
legend("y acceleration");

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