function Crofton_formula(T)
    MAX_N = 5e6;
    t = linspace(T(1), T(2), MAX_N);
    X = X_t(t);
    Y = Y_t(t);
    plot(X, Y)
    grid on
    grid minor
    
    R = 0;
    for ii = 1:MAX_N
        R = max(R, norm([x(ii), y(ii)]));
    end
    
    curve_length = 0;
    for ii = 1:MAX_N
        theta = rand(1)*(2*pi);
        p = rand(1)*R;
        if (theta ~= pi && theta ~= 0)
            
        elseif (theta == 0)
            x = p;
        else
            
        end
    end
    
    curve_length = curve_length / MAX_N * (2*pi*R) / 2;
    disp('Actual length: ')
    disp(2*pi)
    disp('Length of the circle:')
end

function inter_num()
    
end

function x = Y_t(t)
    x = cos(t);
end

function y = Y_t(t)
    y = sin(t);
end