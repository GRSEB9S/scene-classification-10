% data_generation();
load('MLP_withoutSPM.mat');

inputs = train_features;
labels = targets;

% Create a Pattern Recognition Network
net = network_definition();


% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 0/100;


% Train the Network
[net,tr] = train(net,inputs,labels);

% Test the Network
% outputs = net(inputs);
% errors = gsubtract(targets,outputs);
% performance = perform(net,targets,outputs)

% % View the Network
% view(net)
