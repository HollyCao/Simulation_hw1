clear
clf

%constants
G = 6.67408e-11;
M = 5.9722e24;
m = 1000;

%variables
r = [6.678e6, 0, 0];
v = [0, sqrt(G*M/norm(r(1,:),2)),0];
t = 0.0;
dt = 1;
deltaV = 2420;
timeToDeltaV = 5431;

%Orbit 1
%=======================================================================
rplot = r;

while t <= timeToDeltaV
    rlen = norm(r,2);
    accel = -G*M/rlen^2;
    vnext = v + dt*accel*r/rlen;
    rnext = r + dt*v;
    t = t + dt;
    
    rplot = [rplot; rnext];
    v = vnext;
    r = rnext;
end

hold on;
Orbit1 = plot(rplot(:,1), rplot(:,2), 'b', 'LineWidth',1);

%Orbit 2
%=======================================================================
rplot = r;
theta = 0;
rp = r;
rplen = norm(rp,2);
vnext = v + deltaV * [0 1 0];
v = vnext;

while theta <= 3.14159
    
    rlen = norm(r,2);
    accel = -G*M/rlen^2;
    
    vnext = v+dt*accel*r/rlen;
    rnext = r + dt*v;
    t = t + dt;
    
    rplot = [rplot; rnext];
    v = vnext;
    r = rnext;
    
    tempDot = dot(rp,r);
    cosTheta = tempDot/(rlen*rplen);
    theta = acos(cosTheta);
end

disp("Satellite reaches orbit 3 at t = " + t +"s");

Orbit2 = plot(rplot(:,1),rplot(:,2), 'r', 'LineWidth',1);

%Orbit 3
%========================================================================

rplot = r;
tstart = t;

orbitPeriod = (2*pi)*sqrt((norm(r,2).^3)/(G*M));
orbitV = sqrt((G*M)/norm(r,2));
deltaV = orbitV - norm(v,2);

vnext = v + deltaV *[0 -1 0];
v = vnext;

while t < (tstart + orbitPeriod)
 rlen = norm(r,2);
    accel = -G*M/rlen^2;
    vnext = v + dt*accel*r/rlen;
    rnext = r + dt*v;
    t = t + dt;
    
    rplot = [rplot; rnext];
    v = vnext;
    r = rnext;
end

Orbit3 = plot(rplot(:,1),rplot(:,2), 'k','LineWidth',1);

%Annotating Orbits
%========================================================================
legend([Orbit1 Orbit2 Orbit3],{'Orbit 1','Orbit 2', 'Orbit 3'});
title("Transfer Orbits");
xlabel("Altitude (m)");
ylabel("Altitude (m)");
