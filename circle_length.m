function curve_length = circle_length(r)
    curve_length = 0;
    MAX_N = 3e6 + 7;
    for ii = 1:MAX_N
        x = rand(1,1)*2*r - r;
        y = rand(1,1)*2*r - r;
        if (x*x + y*y <= r*r)
            curve_length = curve_length + 2;
        %elseif (x*x + y*y == r*r)
        %    curve_length = curve_length + 1;
        end
    end
    format long
    curve_length = curve_length * (4*r) / (MAX_N);
    disp('Actual length: ')
    disp(2*pi*r)
    disp('Length of the circle:')
end