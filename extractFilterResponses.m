% Modified by Xinshuo Weng
%   Carnegie Mellon University
%   Email: xinshuow@andrew.cmu.edu

function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs:
%   img:                a 3-channel RGB or one channel gray-scale image with
%                       width W and height H
%   filterBank:         a cell array of N filters
%
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses
%
% Note:                 1. the input I may be floating point type and need to be
%                       converted if necessary
%                       2. convolution should handle border problem
%                       3. for gray-scale image, remember duplicate one channel
%                       to 3 same channels
%                       4. convert the image from rgb to lab space before applying
%                       filters to them
%                       5. visualize the image collage
    filterResponses = [];
    
    if (size(img, 3) == 1)
        img = cat(3, img, img, img);
    end
    
    img = RGB2Lab(img);
    for i = 1 : size(filterBank)
        filterResponses = cat(3, filterResponses, imfilter(img, filterBank{i}, 'replicate', 'same', 'conv'));
    end
end
