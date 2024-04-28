function [mAP] = mean_average_precision(y_true, y_scores)
%%%%Compute mean average precision (AP) from prediction scores in
%   multi-class classification via label-level average.
%   -------
%   Params:
%       - y_true: (1, n), start from 1
%            Ground truth label, e.g. [1, 2, 3, 1, 2]
%       - y_scores: (n, C)      C is class number
%
%
%   The mAP is calculated by:
%       mAP = 1/C * \sum_i( AP_i )

    % Normalization
    if sum(sum(y_scores)) - size(y_scores,1) > 1e-6
        y_scores = y_scores./sum(y_scores,2);
    end
    
    % Calculate mean average precision in class-level.
    mAP = 0;
    for k = 1:length(unique(y_true))
        y_temp = zeros(size(y_true));
        y_temp(y_true == k) = 1;
        y_temp_score = reshape(y_scores(:, k), 1, []);
        [~, ~, AP_i] = binary_average_precision(y_temp, y_temp_score);
        mAP = mAP + AP_i;
    end
    mAP = mAP / k;

end
