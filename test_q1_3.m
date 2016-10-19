clear;
close all;
clc;
load('dictionary_100_50_all.mat');
img = imread('../dat/beach/sun_aaxoqeosqjioeukn.jpg');

output = getVisualWords(img, filterBank, dictionary);


a = imagesc(output);

set(gca,'LooseInset',get(gca,'TightInset'))
set(gca,'Visible','off')
% image_data = a.CDataMapping;
% imshow(image_data);
% imwrite(image_data, 'test.jpg');

data = getimage(gca);