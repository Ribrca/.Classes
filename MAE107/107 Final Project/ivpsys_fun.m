function yp = ivpsys_fun(t, y)
% IVPSYS_FUN evaluates the right-hand-side of the ODE's.
% Inputs are current time and current values of y's. 
% y's include the water depth w in y(1) and exit velocity u in y(2).
% Outputs are values of yprime's.
% Call format: yp = ivpsys_fun(t, y)
global d1 d2 l r kappa g nu time_rain precipitation
%% Get friction factor
f=colebrook(r,d2*y(2)/nu);
%% Get precipitation
ytarget=clamped_cubic_spline(time_rain, precipitation, 0, 0, t);
S=clamped_cubic_spline(time_rain, precipitation, 0, 0, t);
%% Obtain yp
yp= [-d2^2/d1^2*y(2)+S, g*y(1)/l-(1+kappa+f*l/d2)*(y(2))^2/(2*l)];
end % function ivpsys_fun