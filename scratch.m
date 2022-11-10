for
    for i = 1:
        pos(i,1) = r*cos(angle);
        pos(i,2) = r*sin(angle);
        pos(i,3) = z;
        angle = angle + delta;
        z = z + zdelta;
        delta = delta + phi;
        r = r + rdelta;
    end
end