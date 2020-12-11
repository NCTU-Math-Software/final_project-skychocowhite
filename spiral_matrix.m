function spiral_matrix(N)
    M = zeros(N, N);
    CNT = N*N;
    if (rem(N, 2) == 1)
        for iter = 1:(N-1)/2
            len = (N-1)-2*(iter-1);
            for c = 1:len
                M(iter, N-(iter-1)-c+1) = CNT;
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
                M(N-(iter-1)-r+1, N-iter+1) = CNT;
                CNT = CNT - 1;
            end
        end
        M((N+1)/2, (N+1)/2) = CNT;
    else 
        for iter = 1:N/2
            len = (N-1)-2*(iter-1);
            for c = 1:len
                M(iter, N-(iter-1)-c+1) = CNT;
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
                M(N-(iter-1)-r+1, N-iter+1) = CNT;
                CNT = CNT - 1;
            end
        end
    end
    disp(M)
end