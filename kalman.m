function [x, P] = kalman(x, P, F, H, Q, R, Z)
    x = F*x;
    P = F*P*F' + Q;
   
    y = Z - H*x;
    K = P*H' / (H*P*H' + R);
    
    x = x + K*y;
    P = (eye(length(x)) - K*H) * P;
end
