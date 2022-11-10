function n = randLog(A,B,rows,cols)
%randLog generates random numbers between A and B that are logarithmically
%spaced.

LA = log10(A);
LB = log10(B);

n = 10.^(LA + (LB-LA)*rand(rows,cols));

end