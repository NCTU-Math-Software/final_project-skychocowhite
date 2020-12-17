function curve_length = circle_length(r)
    curve_length = 0;
    MAX_N = 1e6;
    for ii = 1:MAX_N
        curve_length = curve_length + 2;
    end
    disp('Actual length: ')
    disp(2*pi*r)
    curve_length = curve_length / MAX_N * (2*pi*r) / 2;
end
