function spiral_matrix_diasum(N)
    CNT = N*N;
    SUM = 0;
    if (rem(N, 2) == 1)
        ITERATION = (N-1)/2;
    else
        ITERATION = N/2;
    end
    
    for iter = 1:ITERATION
        len = N-2*iter+1;
        for ii = 1:4
            SUM = SUM + CNT;
            CNT = CNT - len;
        end
    end
    
    if (rem(N, 2) == 1)
        SUM = SUM + CNT;
    end
    
    SUM = uint64(SUM);
    disp(SUM)
end