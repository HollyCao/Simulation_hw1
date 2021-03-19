function vel = deltaV(x, G, M)

     vel =  sqrt((G*M)/x(1)) - sqrt((x(2)/x(1))*((2*G*M)/(x(1)+x(2))));
    
end

