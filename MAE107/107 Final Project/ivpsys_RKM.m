function [t, y] = ivpsys_RKM(y0, h, tspan)
% ivps_Runge_Kutta_Merson solves system ofIVP using Runge-Kutta-Merson 
% method: y' = f(t,y) with the IC y(t = 0) = y0 and a time step h over a
% time period tspan. The function calls ivpsys_fun to evaluate  f(t,y). 
% Outputs are time vector t and the solution matrix y.
% Call format: [t, y] = ivpsys_RKM(y0, h, tspan)


%% Set up parameters and initial conditions
N = ceil((tspan(2)-tspan(1))/h);
num_eq = length(y0);
t = zeros(N+1,1);
y = zeros(N+1,num_eq);
t(1) = tspan(1);
y(1,:) = y0;

%% Setup RK coefficients: c's, p's and q's
% c1 = ...   
% c2 = ...
% c3 = ...
% c4 = ...
% c5 = ...
 
% p1 = ...   
% p2 = ...
% p3 = ...
% p4 = ...

% q11 = ...  
% q21 = ...
% q22 = ...
% q31 = ...
% q32 = ...
% q33 = ...
% q41 = ...
% q42 = ...
% q43 = ...
% q44 = ...

%% Time advancement:
for n = 1:N
    % RK 1st substep
    k1 = h.*ivpsys_fun(t(n),y(n,:));
    
    % RK 2nd substep
    k2 = h.*ivpsys_fun(t(n)+(1/3)*h,y(n,:)+k1*(1/3));
    
    % RK 3rd substep
    k3 = h.*ivpsys_fun((t(n)+h/3),(y(n,:)+k1./6+k2./6));
    
    % RK 4th substep
    k4 = h.*ivpsys_fun((t(n)+h/2),(y(n,:)+k1./8+k3.*3/8));
    
    % RK 5th substep
    k5 = h.*ivpsys_fun((t(n)+h),(y(n,:)+k1/2-k3.*3/2+2.*k4));
    
    % Advance from tn to tn+h using k1 through k5
    y(n+1,:) = y(n,:)+1/6.*(k1+4.*k4+k5);
         
    % Update time
    t(n+1) = t(n)+h;
    
end

end % function ivpsys_RKM