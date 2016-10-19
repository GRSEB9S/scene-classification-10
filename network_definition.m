function [net] = network_definition()

net = network;

net.numInputs = 1;
net.numLayers = 3;

% need edited
net.biasConnect(1) = 1;
net.biasConnect(2) = 1;
net.biasConnect(3) = 1;

net.inputConnect(1,1) = 1;

net.layerConnect = [0 0 0; 1 0 0; 0 1 0];
net.outputConnect = [0 0 1];

net.layers{1}.size = 50;
net.layers{1}.transferFcn = 'tansig';
net.layers{1}.initFcn = 'initnw';


net.layers{2}.size = 10;
net.layers{2}.transferFcn = 'tansig';
net.layers{2}.initFcn = 'initnw';

net.layers{3}.transferFcn = 'softmax';

net.inputWeights{1}.learnFcn = 'learngdm';

% functions
net.initFcn = 'initlay';
net.performFcn = 'crossentropy';     % crossentropy
net.trainFcn = 'trainscg';       % trainscg
net.divideFcn = 'dividerand';
net.adaptFcn = 'adaptwb';
net.trainParam.max_fail = 30;
end

