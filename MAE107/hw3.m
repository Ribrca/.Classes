%Rishi Carlton
%A16828837
%HW3
%Problem 1
%Part a
sprime_x1=-0.0065;
sprime_xn=0;
yi=temperature;
xi=altitude;
xtarget=12000;
%p1a= clamped_cubic_spline(xi, yi, sprime_x1, sprime_xn, xtarget)
p1a=clamped_cubic_spline(xi,yi,sprime_x1,sprime_xn,xtarget)

%Part b
z =0:100:20000;
T=zeros(1,201);
i=0;
for i=1:201
    xtarget=(i-1)*100;
T(1,i)=clamped_cubic_spline(xi,yi,sprime_x1,sprime_xn,xtarget);
i=i+1;
end
figure(1)
plot(T,z,'g',temperature,altitude,'b.')
title('Clamped Cubic Spline of Temperature vs Various Altitudes')
ylabel('Altitude(m)')
xlabel('Temperature(Degrees C)')
legend('Spline','Knots');
p1b = 'See figure 1'

%Part c
p1c=sprintf('The Lagrange Interpolation was inaccurate for altitudes approaching greater or less than those included in the given data set. The Cubic Spline interpolation was far more accurate and followed the same pattern as the data points given, as seen by figure 2. Based on the given graph, the cubic spline appears to have a pattern which could not only be used for interpolation, but extrapolated past the calculated altitudes.')