function e = epsilon_metric(A, B)
% Calculates the epsilon metric between two Pareto sets.
% Throws an error if the matricies does not have the same number of
% columns.
%
% A dominates B If e < 1 
% A weakly dominates B If e = 1
% A is dominated by B If e > 1

    assert(size(A, 2) == size(B, 2), 'A and B must have the same number of columns');


    e = -inf;

    for i = 1:size(B, 1)

        b = B(i, :);
        min_scaling = inf;

        for j = 1:size(A, 1)

            a = A(j, :);

            scaling_factors = a ./ b;
            max_scaling_factor = max(scaling_factors);

            if max_scaling_factor < min_scaling
                min_scaling = max_scaling_factor;
            end
        end

        if min_scaling > e
            e = min_scaling;
        end
    end
end
