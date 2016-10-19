clear;
close all;
clc;

img = imread('../dat/gas_station/sun_aacbvitkinljufrs.jpg');
filterBank = createFilterBank();
response = extractFilterResponses(img, filterBank);
response_visualize = reshape(response, [size(img), size(filterBank, 1)]);

montage(response_visualize, 'Size', [4 5]);
