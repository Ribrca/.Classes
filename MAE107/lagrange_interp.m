function  y = lagrange_interp(xi, yi, x)
%Rishi Carlton
% LAGRANGE_INTERP: use Lagrange polynomials to interpolate value of y at 
% input x using the available data at nodes (xi,yi).
% Call format: y = lagrange_interp(xi, yi, x)


%% Preliminary check:
%{
if x < min(xi) || x > max(xi)  % check bound
    disp('Error: Function does not perform extrapolation.');
    y = NaN;
    return;
elseif any(diff(sort(xi)) == 0) %Check for distinct nodes
    disp('Error: Nodes are not distinct.'); 
    y = NaN;
    return;
end
%}
%% Lagrange interpolation: 
%xi= altitude values 
%yi= temperature values
%x=altitude scalar
%y=temperature scalar
 y = 0;
 for i =1:size(yi,2)
      product=1;
     for j = 1:size(xi,2)
         if i ~= j
               product=product.*((x-xi(j))/(xi(i)-xi(j)))
         else
             product=1.*product;
         end
     end
      y = y+(product.*yi(i))
 end
end % function lagrange_interp