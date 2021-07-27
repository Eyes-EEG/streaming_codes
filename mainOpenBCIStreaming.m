%% Clear
clear;
clc;

%% Train
cfgProtoc = [];
cfgPreproc = [];

trainDataset = Dataset(cfgProtoc, cfgPreproc);

% Add the data to the trainDataset class

%% Classifier
secs = 2;

realTime = StreamingOpenBCI(secs, 125, cfgPreproc);

realTime = realTime.train(trainDataset);
% realTime = realTime.classifyStreamingSim();
