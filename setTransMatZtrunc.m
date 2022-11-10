function transMatZ = setTransMatZtrunc(pos,extPar)

switch extPar.fitOrder
    case 1
        transMatZ = calcTransMatZFirst(pos);
    case 2
        transMatZ = calcTransMatZSecond(pos);
    case 3
        transMatZ = calcTransMatZThird(pos);
    case 4
        transMatZ = calcTransMatZFourth(pos);
    case 5
        transMatZ = calcTransMatZFifth(pos);
end

end