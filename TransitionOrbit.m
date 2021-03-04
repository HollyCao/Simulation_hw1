close all
clf
figure(1)

G = 6.67408 * 10^(-11);
M = 1.9891 * 10^30;
res = 1.496 * 10^11;
tmax = 365.25 * 24 * 60 * 60 * 10;
clockmax = 1000;
dt = tmax/clockmax;
xsave = zeros(1, clockmax);
ysave = zeros(1, clockmax);
tsave = zeros(1, clockmax);

sr = 1;

x = res;
y = 0;
u = 0;
v = sr * sqrt((G*M)/res);

for clock = 1:clockmax
    t = clock*dt;
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    tsave(clock) = t;
    xsave(clock) = x;
    ysave(clock) = y;
    
    %plot(x,y, 'bo', xsave(1:clock), ysave(1:clock))
    %axis equal
    %axis([-res, res, -res, res])
    %drawnow
end
plot(0,0,'r*',xsave,ysave)
axis equal
hold on;

x = 2 * res;
y = 0;
u = 0;
v = sr * sqrt((G*M)/(2 * res));

for clock = 1:clockmax
    t = clock*dt;
    r = sqrt(x^2 + y^2);
    u = u - dt*G*M * x/r^3;
    v = v - dt*G*M * y/r^3;
    x = x + dt*u;
    y = y + dt*v;
    
    tsave(clock) = t;
    xsave(clock) = x;
    ysave(clock) = y;
    
    
end
plot(0,0,'r*',xsave,ysave)
axis equal