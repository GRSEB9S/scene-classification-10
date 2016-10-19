% Modified by Xinshuo Weng
%    Carnegie Mellon University
%    Email: xinshuow@andrew.cmu.edu

function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.

% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here

    h = size(img, 1);
    w = size(img, 2);
    responses = extractFilterResponses(img, filterBank);    % H x W x 3F
%     wordMap = zeros(size(responses));   % H x W x 3F
    
    responses = reshape(responses, h*w, size(responses, 3));   % h*w x 3F
%     responses = responses';
    wordMap = pdist2(responses, dictionary');    % h*w x 100
    
    % find the closest word and its indice for each pixel
    [~, wordMap] = min(wordMap, [], 2);    % 
    wordMap = reshape(wordMap, h, w, size(responses, 3));
end
