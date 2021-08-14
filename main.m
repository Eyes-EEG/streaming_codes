listaFicheros = {'1_close_left_eye_1.csv', '1_close_left_eye_2.csv', '1_close_left_eye_3.csv','1_close_left_eye_4.csv', '1_close_eyes_1.csv', '1_close_eyes_2.csv','1_close_eyes_3.csv', '1_close_eyes_4.csv', '1_close_right_eye_1.csv', '1_close_right_eye_2.csv', '1_close_right_eye_3.csv', '1_close_right_eye_4.csv','1_close_left_eye_1.csv', '1_close_left_eye_2.csv', '1_close_left_eye_3.csv','1_close_left_eye_4.csv'};

markers = {1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4};

myDataset = Dataset();
myCharacteristics = Characteristics();

 for i = 1 : length(markers)
     myDataset = myDataset.addTrial(listaFicheros{i}, markers{i});   
 end
Datos_filtrados = {myDataset.data_filtered(1:160).filtered_data};
CH1 = {};
CH2 = {};
CH3 = {};
CH4 = {};
CH5 = {};
CH6 = {};
CH7 = {};
CH8 = {};
CH9 = {};
CH10 = {};
CH11 = {};
CH12 = {};
CH13 = {};
CH14 = {};
CH15 = {};
CH16 = {};
for i = 1:length(Datos_filtrados)
    CH1 = [CH1,Datos_filtrados{i}(1,:)];
    CH2 = [CH2,Datos_filtrados{i}(2,:)];
    CH3 = [CH3,Datos_filtrados{i}(3,:)];
    CH4 = [CH4,Datos_filtrados{i}(4,:)];
    CH5 = [CH5,Datos_filtrados{i}(5,:)];
    CH6 = [CH6,Datos_filtrados{i}(6,:)];
    CH7 = [CH7,Datos_filtrados{i}(7,:)];
    CH8 = [CH8,Datos_filtrados{i}(8,:)];
    CH9 = [CH9,Datos_filtrados{i}(9,:)];
    CH10 = [CH10,Datos_filtrados{i}(10,:)];
    CH11 = [CH11,Datos_filtrados{i}(11,:)];
    CH12 = [CH12,Datos_filtrados{i}(12,:)];
    CH13 = [CH13,Datos_filtrados{i}(13,:)];
    CH14 = [CH14,Datos_filtrados{i}(14,:)];
    CH15 = [CH15,Datos_filtrados{i}(15,:)];
    CH16 = [CH16,Datos_filtrados{i}(16,:)];
end

Label = [ones(1,40) (repmat (2,1,40)) (repmat (3,1,40)) (repmat (4,1,40))];
  for i = 1 : length(CH1)
       myCharacteristics = myCharacteristics.addAlfaValue(CH1{i}, CH2{i}, CH3{i}, CH4{i}, CH5{i}, CH6{i}, CH7{i}, CH8{i}, CH9{i}, CH10{i}, CH11{i}, CH12{i}, CH13{i}, CH14{i}, CH15{i}, CH16{i}, Label(i))   
  end
Tabla_alfa = struct2table(myCharacteristics.matriz_alfa);
