function teste_kalman()
    
    ## KALMAN 1 DIMENSAO
    #x(1) = 50;
    #F = 1;
    #H = 1;
    #z(1) = H*x(1) + randn;
    
    ## KALMAN VETORIAL
    F = [1 1; 0 1];
    H = [1 0];
    
    x = sin(0:.1:5);
    z = x + randn(1, 51);
    
    #for i=2:50
    #    x(i) = F*x(i-1) + 2*randn;
    #    z(i) = H*x(i) + randn; 
    #end
    
    xe(:,1) = [x(1);0];
    
    #P = (x(1) - z(1)) * (x(1) - z(1))';
    P = (xe(:, 1) - z(1)) * (xe(:, 1) - z(1))';
    Q = eye(length(x)) * 0.1;
    R = eye(length(z)) * 1;
    
    for i=2:51
        [xe(:, i), P] = kalman(xe(:, i-1), P, F, H, Q, R, z(i));
    end
    
    plot(1:51, z, '+', 1, 1:51, x, '-g', 1:51, xe, '-b'); 
end

function robo()
    x = 100;
    y = 100;
    
    dx = 0;
    dy = 0;
    
    ax = 0;
    ay = 0;
    
    for i=1:100
        ax = ax + randn;
        dx = dx + ax;
        x = x + dx;
        
        ay = ay + randn/100;
        dy = dy + ay;
        y = y + dy;
        
    end
end
