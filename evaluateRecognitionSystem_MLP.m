function [conf] = evaluateRecognitionSystem_MLP()
% Evaluates the recognition system for all test-images and returns the confusion matrix
clear;
close all;
clc;
load('MLP_50_100_SPMlayer3.mat');


addpath('../');


% train neural network
% neural_network_configuration();

% load existing network
load('network.mat');

confusion_matrix = zeros(length(mapping), length(mapping));

% prediction
outputs = net(test_features);
[~, index] = max(outputs);

test_size = size(test_features, 2);
% calculate performance
for i = 1:test_size
    confusion_matrix(test_labels(i), index(i)) = confusion_matrix(test_labels(i), index(i)) + 1;
end

accuracy = trace(confusion_matrix) / sum(confusion_matrix(:));
fprintf('The accuracy is %f \n', accuracy);

end