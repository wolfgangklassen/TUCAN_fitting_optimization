function pos = setPos(extPar)

switch extPar.posMode
    case 'rand'
        pos = 160.*rand(3.*extPar.numSensors,1)-80;
    case 'ferret1'
        pos = extPar.ferretPos1;
    case 'ferret2'
        pos = extPar.ferretPos2;
end

end