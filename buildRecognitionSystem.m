function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.
    close all;
    clear;
    clc;

    load('../custom/dictionary_50_100_all.mat');
	load('../dat/traintest.mat');

    layerNum = 3;
    train_features = zeros(size(dictionary, 2) * (4^layerNum - 1) / 3, length(train_imagenames));
	% create train_features
    for i = 1:length(train_imagenames)
        imgPath = sprintf('../dat/%s', train_imagenames{i});
        img = im2double(imread(imgPath));
    	wordMap = getVisualWords(img, filterBank, dictionary);
        train_features(:, i) = getImageFeaturesSPM(layerNum, wordMap, size(dictionary, 2));
        fprintf('image completed %d/%d %s\n', i, length(train_imagenames), imgPath);
    end
    train_labels = train_labels';
    
    

save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end