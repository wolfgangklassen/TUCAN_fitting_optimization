function dFalse = calcdFalseSecond(R,h1,h2,g)
% calcdFalse calulates the mercury contribution to the false EDM signal,
% given a precession volume with radius R in cm, height h1 in cm above the
%origin, and total height (h2-h1) in cm, and given the gradient vector g.
%This calculation assumes the gradient vector is given in units of 
%microtesla/cm^{ell}, where ell is the degree of the polynomial associated
%with the gradient term.  This version calculates up to second order.  It
%assumes the short g vector where g(3) = G_10

dFalse = 8e-30*(R^2/4)*(g(3)*1e6 + g(7)*1e6*(h2+h1));

end