function g_fit = calcGrad(extPar,Bfield,fitMat)
%calcGrad is essentially a wrapper around the "pinv" function, to
%make my other code more readable.  This also allows modifications to be
%made in the future to how this is done.
BfieldTemp = cell2mat(struct2cell(Bfield));
Bx(:) = BfieldTemp(1,1,:);
By(:) = BfieldTemp(2,1,:);
Bz(:) = BfieldTemp(3,1,:);
Bmod(:) = BfieldTemp(4,1,:);
zeroslist = [1,3,4,8,9,15,16,24,25,35,36,48];

switch extPar.fitOrder
    case 1
        fitMat(:,9:end,:) = [];
        zeroslist = [1,3,4,8];
    case 2
        fitMat(:,16:end,:) = [];
        zeroslist = [1,3,4,8,9,15];
    case 3
        fitMat(:,25:end,:) = [];
        zeroslist = [1,3,4,8,9,15,16,24];
    case 4
        fitMat(:,36:end,:) = [];
        zeroslist = [1,3,4,8,9,15,16,24,25,35];
    case 5
        %do nothing;
end

switch extPar.fitMode
    case 'Bvec'
        tempMat1 = fitMat(:,:,1);
        tempMat2 = fitMat(:,:,2);
        tempMat3 = fitMat(:,:,3);
        fitMat = [tempMat1;tempMat2;tempMat3];        
        Bfit = [Bx';By';Bz'];        
        g_fit = pinv(fitMat)*Bfit;
    case 'Bz'
        fitMat = fitMat(:,:,3);
        fitMat(:,zeroslist) = [];
        Bfit = Bz';
        g_fit = pinv(fitMat)*Bfit;
    case 'Bmod'
        fitMat = fitMat(:,:,3);
        fitMat(:,zeroslist) = [];
        Bfit = Bmod';
        g_fit = pinv(fitMat)*Bfit;
    case 'DENNIS'
        error('"Ye arrive at Dennis. He wears a sporty frock coat and a long jimberjam. He paces about nervously. Obvious exits are NOT DENNIS."');
end

end