function buildRecognitionSystem_SPM_all()
% Creates vision.mat. Generates training features for all of the training images.
    close all;
    clear;
    clc;

    addpath('../matlab/');
    load('dictionary_50_100_all.mat');
% 	load('../dat/traintest.mat');
    image_name_list();
    
    trainimage_number = length(train_imagenames);
    train_labels = zeros(1, trainimage_number);
    train_labels(1:1000) = 1;
    train_labels(1001:2000) = 2;
    train_labels(2001:3000) = 3;
    train_labels(3001:4000) = 4;
    train_labels(4001:5000) = 5;
    train_labels(5001:6000) = 6;
    train_labels(6001:7000) = 7;
    train_labels(7001:8000) = 8;
    
    layerNum = 3;
    train_features = zeros(size(dictionary, 2) * (4^layerNum - 1) / 3, trainimage_number);
	% create train_features
    for i = 1:trainimage_number
        imgPath = sprintf('/home/xinshuo/scene_images/%s', train_imagenames{i});
        img = im2double(imread(imgPath));
    	wordMap = getVisualWords(img, filterBank, dictionary);
        train_features(:, i) = getImageFeaturesSPM(layerNum, wordMap, size(dictionary, 2));
        fprintf('image completed %d/%d %s\n', i, length(train_imagenames), imgPath);
    end
    train_labels = train_labels';

save('vision_50_100_SPMlayer3_all.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end