function th = cininvpie(tform, isLeft, varargin)
L1 = -0.12;
if isLeft
    L1 = -L1;
end
L2 = 0;
% Distancia de pierna
L3 = 0.4; 
% Distancia de tobillo
L4 = 0.38;  
L5 = 0;
tform(1,4) = -tform(1,4);
tform = tform - [0 0 0 L1;0 0 0 0;0 0 0 -L2;0 0 0 0];
R = tform(1:3,1:3);%%De aqúi se obtiene la position y orienatción
p = tform(1:3, 4);
Rp = R';%%%%Conseguir la transpuesta
n = Rp(:,1);
s = Rp(:,2);
a = Rp(:,3);
p = -Rp*p;
%%Solución analítica 
cos4 = ((p(1)+L5)^2 + p(2)^2 + p(3)^2 - L3^2 - L4^2)/(2*L3*L4);
temp = 1 - cos4^2;
if temp < 0
    temp = 0;
end
th4 = atan2(sqrt(temp),cos4);%%%Se puede cambiar la raíz cuadrada negativa
temp = (p(1)+L5)^2+p(2)^2;
if temp < 0
    temp = 0;
end
th5 = atan2(-p(3),sqrt(temp))-atan2(sin(th4)*L3,cos(th4)*L3+L4);
th6 = atan2(p(2),-p(1)-L5);
temp = 1-(sin(th6)*a(1)+cos(th6)*a(2))^2;
if temp < 0
    temp = 0;
end
th2 = atan2(-sqrt(temp),sin(th6)*a(1)+cos(6)*a(2));
th2 = th2 + pi/2; % pi/2 offset
th1 = atan2(-sin(th6)*s(1)-cos(th6)*s(2),-sin(th6)*n(1)-cos(th6)*n(2));

th345 = atan2(a(3),cos(th6)*a(1)-sin(th6)*a(2));
th345 = th345 - pi;
th3 = th345 - th4 - th5;
%%Mostrar los ángulos
th = [th1 th2 th3 th4 th5 th6];