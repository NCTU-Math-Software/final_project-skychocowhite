%% Two dimenstional curve length approximation - using Crofton formula
function crofton_formula_circle(T)
    % Input: An interval, the domain of parametric equation.
    % Output: A value, an approximate length of the curve.
    %
    % Example:
    % > (Change the parametric equation in the function to x and y coordinates)
    % > (If you can, calculate curve length at first to check error.)
    % > T = [0,1];
    % > crofton_formula(T);
    
    % Check domain interval error
    if (T(1) > T(2))
        disp('Input error:')
        disp('Left end time should be less than or equal to right one.')
        return
    end

    MAX_DRAW = 5e6;       % Number of drawing points
    MAX_SAMPLE = 1e4;     % Number of root testing points
    MAX_ITERATION = 1e3;  % Number of iterations for random execution
    
    % Draw curve
    t = linspace(T(1), T(2), MAX_DRAW);
    X = X_t(t);
    Y = Y_t(t);
    plot(X, Y)
    grid on
    grid minor
    
    % Calculate maximum radius of domain from origin
    R = 0;
    for ii = 1:MAX_DRAW
        R = max(R, norm([X(ii), Y(ii)]));
    end
    
    t = linspace(T(1), T(2), MAX_SAMPLE);  % Pick test root points
    curve_length = 0;  % Summation of intersections

    tic  % Count time
    % Run random execution
    for ii = 1:MAX_ITERATION
        theta = rand(1)*(2*pi);
        p = rand(1)*R;
        curve_length = curve_length + inter_cnt(t, p, theta);
        modify(t, T);  % Shift sample points
    end
    toc  % Count time
    
    % Show approximate and accrate curve lengths
    curve_length = curve_length / MAX_ITERATION * (2*pi*R) / 2;
    disp('Approximate length:')  % Approximate
    disp(curve_length)
    disp('Actual length:')       % Accurate
    disp(4*pi*123)
end

%% Function for counting intersections
function cnt = inter_cnt(t, p, theta)
    cnt = 0;  % Number of current intersections
    % Check end point
    v1 = X_t(t(1))*cos(theta) + Y_t(t(1))*sin(theta) - p;
    if (v1 == 0)
        cnt = cnt+1;
    end
    
    % Test intermediate value theorem at y = 0
    for ii = 1:length(t)-1
        v1 = X_t(t(ii))*cos(theta) + Y_t(t(ii))*sin(theta) - p;
        v2 = X_t(t(ii+1))*cos(theta) + Y_t(t(ii+1))*sin(theta) - p;
        if (v2 == 0)  % Check end point
            cnt = cnt+1;
        end
        if (v1*v2 < 0)  % There is an intersection
            cnt = cnt+1;
        end
    end
end

%% Function for shift sample points with random value
function modify(t, T)
    rnd = rand(1)*(T(2)-T(1));  % Randomize shift values
    
    for ii = 1:length(t)  % Shift sample points
        t(ii) = t(ii) + rnd;
    end
    
    idx = length(t);  % Modify into domain range
    while (idx > 0 && t(idx) > T(2))
        t(idx) = t(idx) - T(2) + T(1);
        idx = idx-1;
    end
    t = sort(t);
end

%% Parametric equation of x coordinate
function x = X_t(t)
    x = zeros(1, length(t));
    for ii = 1:length(t)
        x(ii) = 123*cos(t(ii));
    end
end

%% Parametric equation of y coordinate
function y = Y_t(t)
    y = zeros(1, length(t));
    for ii = 1:length(t)
        y(ii) = 123*sin(t(ii));
    end
end
