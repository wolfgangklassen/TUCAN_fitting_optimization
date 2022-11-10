function B = calcBfield(transMat,g)
%calcBfieldErrors calculates Bx, By, and Bz using their various
%transformation matrices.  Then it calculates Bmod, which is then reported
%as the output.  This value is later used as Bz for the purposes of fitting
%to the harmonic functions. transMat is a vector of 3 transformation
%matrices, one for each dimension.
%March31: added ability to switch bewteen a Bmod and Bz sensor
%April 2: changed function to output B structure that has all the Bfield
%info in it, including Bmod
B.x = transMat(:,:,1)*g;
B.y = transMat(:,:,2)*g;
B.z = transMat(:,:,3)*g;
B.mod = sqrt(B.x.^2 + B.y.^2 + B.z.^2);
end