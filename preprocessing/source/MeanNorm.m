function [X] = MeanNorm(M, Index)
%%%% Min-Max Normalization  with incomplete data
%   Params:
%   -------
%       - M: matrix, (sample_num, feature_dim)
%            Input data matrix.
%       - Index: matrix, (sample_num, 1)
%            Missing sample indicator matrix, 1 for exist; 0 for miss.

    if nargin < 2
        Index = ones(size(M, 1), 1);
    end

    temp = M(Index==1, :);
    temp_max = max(temp);
    temp_min = min(temp);

    % avoid zero division
    zero_idx = find((temp_max - temp_min) == 0);
    temp_max(zero_idx) = temp_max(zero_idx) + 1;

    % min-max normalization
    X = zeros(size(M));
    X(Index==1, :) = (temp - mean(temp, 1)) ./ (temp_max - temp_min);





end
