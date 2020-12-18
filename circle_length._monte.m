function curve_length = Circle_length_Monte(r)
    curve_length = 0;
    MAX_N = 5e6;
    for ii = 1:MAX_N
        theta = rand(1)*(2*pi);
        p = rand(1)*(2*r);
        if (p < r)
            curve_length = curve_length + 2;
        elseif (p == r)
            curve_length = curve_length + 1;
        end
    end
    format long
    curve_length = curve_length / MAX_N * (4*pi*r) / 2;
    disp('Actual length: ')
    disp(2*pi*r)
    disp('Length of the circle:')
end
