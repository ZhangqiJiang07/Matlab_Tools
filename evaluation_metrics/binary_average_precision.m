function [precision, recall, AP] = binary_average_precision(y_true, y_scores)
%%%%Compute average precision (AP) from prediction scores in binary classification.
%   -------
%   Params:
%       - y_true: (1, n)      n is sample number
%           Ground truth label, where 1 is setted as positive label.
%       - y_scores: (1, n)
%           Normalized sample score.

    [sorted_y_scores, idx] = sort(y_scores, 'descend');
    sorted_y_true = y_true(idx);

    posi_num = sum(sorted_y_true);
    threshold = sort(unique(sorted_y_scores), 'descend');

    precision = zeros(1, length(threshold));
    recall = zeros(1, length(threshold));
    for i = 1:length(threshold)
        aug_sorted_y_scores = [sorted_y_scores, -1];
        idx = find(aug_sorted_y_scores < threshold(i), 1);
        precision(i) = sum(sorted_y_true(1:idx-1)) / (idx - 1);
        recall(i) = sum(sorted_y_true(1:idx-1)) / posi_num;
    end

    % right rectangle method rule for numerical integration
    diff_recall = recall - [0, recall(1:end-1)];
    AP = sum(diff_recall.*precision);
    % AP = trapz(recall, precision);

end
