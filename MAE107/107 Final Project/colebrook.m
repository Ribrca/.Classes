function xn = colebrook(roughness_ratio, Re)
% COLEBROOK: solves for the root of the Cole-Brook equation using
% secant method. Inputs are roughness_ratio and Reynolds number Re. 
% Output is friction factor f from the root estimate.
% Call format: f = colebrook(roughness_ratio, Re)

%% Setup for secant method
n = 0;
max_iter = 25;
tolerance = 1e-5;

%% Setup for Cole-Brook equation and initial guesses
colebrook_eqn = @(x) 1/sqrt(x) + 2*log10(roughness_ratio/3.72 + 2.51/sqrt(x)/Re);
x0 = 0.02;      % initial guesses
x1 = 0.04;
%% Execute secant method
while n <= max_iter
    out=(-colebrook_eqn(x1)*(x1-x0))/((colebrook_eqn(x1)-colebrook_eqn(x0)));
    % Implement the secant formula and stop criteria based on given tolerance
    if  abs(out)<tolerance
        return
    end
        xn=out+x1;
        x0=x1;
        x1=xn;
        n=n+1;
end

f = xn % output friction factor

%% When secant is not converging, set xn to NaN
if n > max_iter
    xn = NaN;
    disp('Secant method does converge within the max number of iterations')
end

end % function colebrook