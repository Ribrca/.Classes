function [alpha, beta, fun] = best_fit_power_model(xbar,ybar)
% BEST_FIT_POWER_MODEL fits a power model in the form: 
% ybar = alpha*xbar^beta. Function returns alpha and beta
% and anonymous function of the fit.
% Call format: [alpha, beta, fun] = best_fit_power_model(xbar,ybar)

%% Transform variables
xi = log10(xbar);
yi = log10(ybar);

%% Least squares for linear model
n = length(ybar);
xiyi=zeros(1,3001);
kk=0;
for kk=1:3001
    xiyi(kk)=(xi(kk))*(yi(kk));
    xi2(kk)=(xi(kk))^2;
end
m = (n*sum(xiyi)-sum(xi)*sum(yi))/(n*sum(xi2)-(sum(xi))^2);
b = (sum(xi2)*sum(yi)-sum(xi)*sum(xiyi))/(n*sum(xi2)-(sum(xi))^2);

%% Transform back to power model
alpha = 10^b;
beta = m;
fun = @(x) alpha*x.^beta;

end % function best_fit_power_model