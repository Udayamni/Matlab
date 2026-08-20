clc; 
close all; 

Vdc = 800;
Fsw = 10e3;
Fg = 50;
S = 45e3;
V_ll = 400;
V_ph = V_ll/(sqrt(3));
I_g = S/(3*V_ph);
delta_ig = 0.03; 
x = 0.035;

%Filter value determination
L_inv = Vdc/(8*Fsw*I_g*delta_ig);
Cf = x* S/(2*pi*Fg*V_ph^2);
Cb = Cf/x;
r = abs((1/0.05 -1)/(1- (L_inv*Cb*(2*pi*Fsw)^2*x)));
Lg = r*L_inv;
Fres = 1/(sqrt(Lg*L_inv/(Lg+L_inv)*Cf))/(2*pi);
rd = 1/(6*pi*Fres*Cf);

%PI Values

Kp = 2*0.8*2*pi*1000*L_inv;
Ki = L_inv*(2*pi*1000)^2;
