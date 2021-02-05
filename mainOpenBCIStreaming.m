%% Clear
clear;
clc;

%% Train
cfgProtoc = [];
cfgPreproc = [];

trainDataset = Dataset(cfgProtoc, cfgPreproc);

% Add the data to the trainDataset class

%% Classifier
realTime = StreamingOpenBCI(128, cfgPreproc);

realTime = realTime.train(trainDataset);
% realTime = realTime.classifyStreaming();
