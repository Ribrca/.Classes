%Question 1
clear, close all, syms s Vi Vs C L R R1 R2 R_load zeta C2
% x={I_L, I_C, I_Rload V0}  <-- unknown vector
A  =[ 1 -1 -1 0 ;     % I_L-I_C-I_load = 0
      L*s 0 0 1;    % -V0-LsI_L=V_i
       0  1 0  -C*s;   % I_C-CsV0=0
      0 0   -R_load 1];    % V0-I_Rload*R_load=0
b  =[ 0; Vi; 0; 0];
x=A\b
Vo_LPF3=simplify(x(4))

%Question 2
zeta=.1; omega4=10; F_LPF3=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(4), RR_bode(F_LPF3);
zeta=.7; omega4=10; F_LPF3=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(5), RR_bode(F_LPF3);
zeta=1; omega4=10; F_LPF3=RR_tf([omega4^2],[1 2*zeta*omega4 omega4^2]);
figure(6), RR_bode(F_LPF3);

%Question 3
% x={I_L, I_C, I_Rload V0  I_C2 V2}  <-- unknown vector
A  =[ 1    -1  -1       0   0   0;     % I_L-I_C-I_load = 0
     L*s  0    0        1   0   0;    % V0+LsI_L=V_i
      0    1    0      -C*s 0   0;     % I_C-CsV0=0
      0    0   -R_load  1   0   -1;    % V0-I_Rload*R_load=0
      0    0    0       0   1   -C2*s;   % I_C2-C2sV2=0
      0    0    1       0   -1   0];   % I_Rload-I_C2

b  =[ 0; Vi; 0; 0; 0; 0];
x=A\b
Vo_LPF4=simplify(x(4))

%Question 4
C2=4*C;
R_load=sqrt(L/C);
% x={I_L, I_C, I_Rload V0  I_C2 V2}  <-- unknown vector
A  =[ 1    -1  -1       0   0   0;     % I_L-I_C-I_load = 0
     L*s  0    0        1   0   0;    % V0+LsI_L=V_i
      0    1    0      -C*s 0   0;     % I_C-CsV0=0
      0    0   -sqrt(L/C)  1   0   -1;    % V0-I_Rload*R_load=0
      0    0    0       0   1   -4*C*s;   % I_C2-C2sV2=0
      0    0    1       0   -1   0];   % I_Rload-I_C2
b  =[ 0; Vi; 0; 0; 0; 0];
x=A\b
Vo_LPF4_2=simplify(x(4))