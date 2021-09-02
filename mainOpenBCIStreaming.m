% Clear
clear;
clc;

% Train
listaFicheros = {'1_close_left_eye_1.csv', '1_close_left_eye_2.csv', '1_close_left_eye_3.csv','1_close_left_eye_4.csv', '1_close_eyes_1.csv', '1_close_eyes_2.csv','1_close_eyes_3.csv', '1_close_eyes_4.csv', '1_close_right_eye_1.csv', '1_close_right_eye_2.csv', '1_close_right_eye_3.csv', '1_close_right_eye_4.csv','1_close_left_eye_1.csv', '1_close_left_eye_2.csv', '1_close_left_eye_3.csv','1_close_left_eye_4.csv'};

markers = {1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4};

trainDataset = Dataset();

for i = 1 : length(markers)
     trainDataset = trainDataset.addTrial(listaFicheros{i}, markers{i});   
 end

% Add the data to the trainDataset class

% Classifier
secs = 2;

Datos_filtrados = {trainDataset.data_filtered(1:160).filtered_data};


realTime = StreamingOpenBCI(secs, 125);

realTime = realTime.train(Datos_filtrados);

% realTime = realTime.classifyStreamingSim();
