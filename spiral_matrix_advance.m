function spiral_matrix_advance(N)
    M = zeros(N, N);
    CNT = N*N;
    if (rem(N, 2) == 1)
        ITERATION = (N-1)/2;
    else
        ITERATION = N/2;
    end
    
    for iter = 1:ITERATION
        len = N-2*iter+1;
        for c = 1:len
            M(iter, N-iter-c+2) = CNT;
            CNT = CNT - 1;
        end
        for r = 1:len
            M(iter+r-1, iter) = CNT;
            CNT = CNT - 1;
        end
        for c = 1:len
            M(N-iter+1, iter+c-1) = CNT;
            CNT = CNT - 1;
        end
        for r = 1:len
            M(N-iter-r+2, N-iter+1) = CNT;
            CNT = CNT - 1;
        end
    end
    
    if (rem(N, 2) == 1)
        M((N+1)/2, (N+1)/2) = CNT;
    end
    
    disp(M)
end
