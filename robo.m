chassi = [[ 1  1  1  0  0  0 -1 -1 -1],
          [ 1  0 -1  1  0 -1 -1  0  1]];
tam = 5;


rx = 0;
ry = 0;
ang = 0.01;

desenho(1,:) = chassi(1,:) * tam;
desenho(2,:) = chassi(2,:) * tam;
          
e = randn();
d = randn();
for i=0:100
    ang = ang + (e-d)/tam;
    rx = rx + (e+d)*cos(ang)/2;
    ry = ry + (e+d)*sin(ang)/2;
    
    rot = [cos(ang) -sin(ang);
           sin(ang)  cos(ang)];
    
   # desenho(1,:) = chassi(1,:) * tam;
   # desenho(2,:) = chassi(2,:) * tam;    
     
    for i=1:9
        desenho(:,i) = rot * desenho(:,i);
        #desenho(:,i) = rot * (desenho(:,i) - desenho(:,end)); 
    end
    
    desenho(1,:) = desenho(1,:) + rx;
    desenho(2,:) = desenho(2,:) + ry;
    
    
    plot(desenho(1,:), desenho(2,:), 'bx');
    axis([-100 100 -100 100]);
    drawnow;
end