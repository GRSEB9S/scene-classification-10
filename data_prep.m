clear;
close all;
clc;


load('../dat/traintest.mat');
load('vision_50_100_SPMlayer3_all.mat');

layerNum = 3;
img_number = size(train_features, 2);
targets = zeros(max(train_labels), img_number);

% training dataset
for i = 1:img_number
    targets(train_labels(i), i) = 1;
end

% test dataset generation
test_size = size(test_imagenames, 1);
test_features = zeros(size(train_features, 1), test_size);
for i = 1:test_size
    imgPath = sprintf('../dat/%s', test_imagenames{i});
    image = im2double(imread(imgPath));
    
    %     	fprintf('[Getting Visual Words..]\n');
    wordMap = getVisualWords(image, filterBank, dictionary);
    test_features(:, i) = getImageFeaturesSPM(layerNum, wordMap, size(dictionary,2));
    fprintf('image completed %d/%d %s\n', i, length(test_imagenames), test_imagenames{i});
end

% test dataset
save('MLP_50_100_SPMlayer3_all.mat', 'train_features', 'targets', 'mapping', 'test_features', 'test_labels');
