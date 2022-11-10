function dFalse = calcdFalseFourth(R,h1,h2,g)
% calcdFalse calulates the mercury contribution to the false EDM signal,
% given a precession volume with radius R in cm, height h1 in cm above the
%origin, and total height (h2-h1) in cm, and given the gradient vector g.
%This calculation assumes the gradient vector is given in units of 
%microtesla/cm^{ell}, where ell is the degree of the polynomial associated
%with the gradient term.  This version calculates up to fourth order.  It
%assumes the full 48 term gradient vector where g(6) = G_10

dFalse = 8e-30*(R^2/4)*(g(3)*1e6 + g(7)*1e6*(h2+h1) - ...
    (g(13)*1e6/2)*(R^2 - 2*h1^2 - 2*h1*h2 - 2*h2^2) + ...
    (g(21)*1e-6)*((R.^2).*((h2^2 - h1^2)/(h2 - h1)) - (h2^4 - h1^4)/(h2 - h1)));

end