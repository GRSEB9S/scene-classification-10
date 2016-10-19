function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.

    filterBank  = createFilterBank();
    alpha = 50;
    filterResponses = zeros(alpha * size(imPaths, 1), 3 * size(filterBank, 1));
    K = 100;

    for i = 1:size(imPaths,1)
        
        img = imread(imPaths{i});
%         pixel_chosen = zeros(2, alpha);

        responses = extractFilterResponses(img, filterBank);    % H x W x 3F

        % randomly choose alpha pixels
        % pixel_chosen 2 x 50
        
        number_pixel = size(img, 1) * size(img, 2);
        pixel_chosen = randperm(number_pixel, alpha);
        pixel_chosen_row = mod(pixel_chosen-1, size(img, 1)) + 1;
        pixel_chosen_col = ceil(pixel_chosen / size(img, 1));

        % get filter responses for all images with randomly chosen pixels
        for j = 1:alpha
            filterResponses(alpha * (i - 1) + j, :) = responses(pixel_chosen_row(j), pixel_chosen_col(j), :);
        end
        
        fprintf('image completed %d/%d\n', i, size(imPaths, 1));
    end
    
    disp('start kmeans......\n');
    [~, dictionary] = kmeans(filterResponses, K, 'EmptyAction', 'drop', 'MaxIter', 1000);
    dictionary = dictionary';
    disp('dictionary finished\n');
end
