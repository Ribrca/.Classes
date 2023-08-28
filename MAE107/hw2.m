%Rishi Carlton
%A16828837
%HW2

%Question 1

%a
T = 300:100:1000;
P = 50000:10000:200000;
[P,T] = meshgrid(P,T');
p1a = van_der_Waals(P,T);


%b
figure(1)
surf(P,T,p1a)
title('Variance in Specific Volume for Pressure and Temperature')
xlabel('Pressure(Pa)')
ylabel('Temperature(K)')
zlabel('Specific Volume(m^3/kg)')
colorbar
shading interp
p1b = 'See figure 1'

%Question 2

%a
xi=[9000 10000 15000];
yi=[-43.42 -49.90 -56.50];
x=12000;
p2a = lagrange_interp(xi, yi, x)

%b
xi=[9000 10000 15000 20000];
yi=[-43.42 -49.90 -56.50 -56.60];
x=12000;
p2b = lagrange_interp(xi, yi, x)

%c
xi=[0 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000];
yi=[15.00 8.50 2.00 -4.49 -10.98 -17.47 -23.96 -30.45 -36.94 -43.42 -49.90 -56.50 -56.60];
x=12000;
p2c = lagrange_interp(xi, yi, x)

%d
z=0:100:20000
xi=[0 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000];
yi=[15.00 8.50 2.00 -4.49 -10.98 -17.47 -23.96 -30.45 -36.94 -43.42 -49.90 -56.50 -56.60];
x=z;
T=lagrange_interp(xi, yi, x);
figure(2)
plot(T,x,'g',yi,xi,'b.')
title('Interpolation of Temperature based on Altitude','Nodes')
legend('Interpolation','Nodes')
ylabel('Altitude(m)')
xlabel('Temperature(Degrees C)')
p2d = 'See figure 2'

%e
p2e='The interpolation is extremely accurate across all values of altitude. The graph of the interpolation and the nodes themselves line up perfectly.'








