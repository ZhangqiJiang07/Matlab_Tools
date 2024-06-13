function [X] = ZscoreNorm(M, Index)
%%%% Z-score Standardization with incomplete data
%   Params:
%   -------
%       - M: matrix, (sample_num, feature_dim)
%            Input data matrix.
%       - Index: Indicator matrix, (sample_num, 1)
%            1 for exists; 0 for missing.
    if nargin < 2
        Index = ones(size(M, 1), 1);
    end

    X = zeros(size(M));
    temp = M(Index==1, :);
    temp_std = std(temp, [], 1);
    temp_std(temp_std == 0) = 1;

    % Standardization
    X(Index==1, :) = (temp - mean(temp, 1)) ./ temp_std;

end
