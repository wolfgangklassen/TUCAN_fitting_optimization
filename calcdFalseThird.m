function dFalse = calcdFalseThird(R,h1,h2,g)
% calcdFalse calulates the mercury contribution to the false EDM signal,
% given a precession volume with radius R in cm, height h1 in cm above the
%origin, and total height (h2-h1) in cm, and given the gradient vector g.
%This calculation assumes the gradient vector is given in units of 
%microtesla/cm^{ell}, where ell is the degree of the polynomial associated
%with the gradient term.  This version calculates up to third order, and
%expects the shorter G vector, where G(3) = G_10
dFalse = 8e-30*(R^2)*(g(3)*1e6 + g(7)*1e6*(h2+h1) - ...
    (g(13)*1e6/2)*(R^2 - 2*h1^2 - 2*h1*h2 - 2*h2^2));
end