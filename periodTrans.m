
function period = periodTrans(x, G, M)
   
   period  = (pi * (x(1) + x(2))^(3/2)) / (sqrt(2 * G * M) * 2);

end