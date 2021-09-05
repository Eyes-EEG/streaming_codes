classdef Features
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This class computed the features table %
    % to train                               %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    properties
        matriz_alfa;
    end
    
    methods
        function obj = Features()
        end
        
        function [obj, featTable] = generateModelFeatures (obj,Datos_filtrados)
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
            for i = 1:160
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
            
            canal1 = obj.CalculaValorAlfa_modelo(CH1);
            canal2 = obj.CalculaValorAlfa_modelo(CH2);
            canal3 = obj.CalculaValorAlfa_modelo(CH3);
            canal4 = obj.CalculaValorAlfa_modelo(CH4);
            canal5 = obj.CalculaValorAlfa_modelo(CH5);
            canal6 = obj.CalculaValorAlfa_modelo(CH6);
            canal7 = obj.CalculaValorAlfa_modelo(CH7);
            canal8 = obj.CalculaValorAlfa_modelo(CH8);
            canal9 = obj.CalculaValorAlfa_modelo(CH9);
            canal10 = obj.CalculaValorAlfa_modelo(CH10);
            canal11 = obj.CalculaValorAlfa_modelo(CH11);
            canal12 = obj.CalculaValorAlfa_modelo(CH12);
            canal13 = obj.CalculaValorAlfa_modelo(CH13);
            canal14 = obj.CalculaValorAlfa_modelo(CH14);
            canal15 = obj.CalculaValorAlfa_modelo(CH15);
            canal16 = obj.CalculaValorAlfa_modelo(CH16);
            Label = [ones(1,40) (repmat (2,1,40)) (repmat (3,1,40)) (repmat (4,1,40))];
            for i = 1:160
                obj.matriz_alfa(length(obj.matriz_alfa)+1).canal1 = canal1 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal2 = canal2 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal3 = canal3 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal4 = canal4 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal5 = canal5 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal6 = canal6 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal7 = canal7 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal8 = canal8 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal9 = canal9 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal10 = canal10 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal11 = canal11 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal12 = canal12 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal13 = canal13 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal14 = canal14 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal15 = canal15 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).canal16 = canal16 {i};
                obj.matriz_alfa(length(obj.matriz_alfa)).Label = Label (i);
            end
            
            featTable = struct2table(obj.matriz_alfa);
 
        end
        
        function featTable = generateFeatures (obj,data_structure)
            data = data_structure{1};
            CH1 = data (1,:);
            canal1 = obj.CalculaValorAlfa(CH1);
            obj.matriz_alfa(length(obj.matriz_alfa)+1).canal1 = canal1;
            
            CH2 = data (2,:);
            canal2 = obj.CalculaValorAlfa(CH2);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal2 = canal2;
            
            CH3 = data (3,:);
            canal3 = obj.CalculaValorAlfa(CH3);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal3 = canal3;
            
            CH4 = data (4,:);
            canal4 = obj.CalculaValorAlfa(CH4);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal4 = canal4;
            
            CH5 = data (5,:);
            canal5 = obj.CalculaValorAlfa(CH5);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal5 = canal5;
            
            CH6 = data (6,:);
            canal6 = obj.CalculaValorAlfa(CH6);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal6 = canal6;
            
            CH7 = data (7,:);
            canal7 = obj.CalculaValorAlfa(CH7);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal7 = canal7;
            
            CH8 = data (8,:);
            canal8 = obj.CalculaValorAlfa(CH8);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal8 = canal8;
            
            CH9 = data (9,:);
            canal9 = obj.CalculaValorAlfa(CH9);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal9 = canal9
            
            CH10 = data (10,:);
            canal10 = obj.CalculaValorAlfa(CH10);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal10 = canal10;
            
            CH11 = data (11,:);
            canal11 = obj.CalculaValorAlfa(CH11);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal11 = canal11;
            
            CH12 = data (12,:);
            canal12 = obj.CalculaValorAlfa(CH12);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal12 = canal12;
            
            CH13 = data (13,:);
            canal13 = obj.CalculaValorAlfa(CH13);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal13 = canal13;
            
            CH14 = data (14,:);
            canal14 = obj.CalculaValorAlfa(CH14);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal14 = canal14;
            
            CH15 = data (15,:);
            canal15 = obj.CalculaValorAlfa(CH15);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal15 = canal15;
            
            CH16 = data (16,:);
            canal16 = obj.CalculaValorAlfa(CH16);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal16 = canal16;
            
            featTable = struct2table(obj.matriz_alfa);
        end
        
        function canal1 = CalculaValorAlfa (obj,CH1)
                sampling_rate = 125;
                nfft = DataFilter.get_nearest_power_of_two(sampling_rate);
                original_data = CH1;
                detrended = DataFilter.detrend(original_data, int32(DetrendOperations.LINEAR));
                [ampls, freqs] = DataFilter.get_psd_welch(detrended, nfft, nfft / 2, sampling_rate, int32(WindowFunctions.HANNING));
                canal1 = DataFilter.get_band_power(ampls, freqs, 7.0, 13.0);
        end
        
        function canal1 = CalculaValorAlfa_modelo (obj,CH1)
                canal1 = {};
                for i = 1:160
                    sampling_rate = 125;
                    nfft = DataFilter.get_nearest_power_of_two(sampling_rate);
                    original_data = CH1{i};
                    detrended = DataFilter.detrend(original_data, int32(DetrendOperations.LINEAR));
                    [ampls, freqs] = DataFilter.get_psd_welch(detrended, nfft, nfft / 2, sampling_rate, int32(WindowFunctions.HANNING));
                    chanel1 = DataFilter.get_band_power(ampls, freqs, 7.0, 13.0);
                    canal1 = [canal1,chanel1];
                end
    end
end
end
