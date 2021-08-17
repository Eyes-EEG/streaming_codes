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
        
        function [obj, featTable] = generateModelFeatures (obj,Datos_filtrados, Label)

            CH1 = Datos_filtrados(1,:);
            CH2 = Datos_filtrados(2,:);
            CH3 = Datos_filtrados(3,:);
            CH4 = Datos_filtrados(4,:);
            CH5 = Datos_filtrados(5,:);
            CH6 = Datos_filtrados(6,:);
            CH7 = Datos_filtrados(7,:);
            CH8 = Datos_filtrados(8,:);
            CH9 = Datos_filtrados(9,:);
            CH10 = Datos_filtrados(10,:);
            CH11 = Datos_filtrados(11,:);
            CH12 = Datos_filtrados(12,:);
            CH13 = Datos_filtrados(13,:);
            CH14 = Datos_filtrados(14,:);
            CH15 = Datos_filtrados(15,:);
            CH16 = Datos_filtrados(16,:);
            
            canal1 = obj.CalculaValorAlfa(CH1);
            obj.matriz_alfa(length(obj.matriz_alfa)+1).canal1 = canal1;
            
            canal2 = obj.CalculaValorAlfa(CH2);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal2 = canal2;
            
            canal3 = obj.CalculaValorAlfa(CH3);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal3 = canal3;
            
            canal4 = obj.CalculaValorAlfa(CH4);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal4 = canal4;
            
            canal5 = obj.CalculaValorAlfa(CH5);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal5 = canal5;
            
            canal6 = obj.CalculaValorAlfa(CH6);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal6 = canal6;
            
            canal7 = obj.CalculaValorAlfa(CH7);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal7 = canal7;
            
            canal8 = obj.CalculaValorAlfa(CH8);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal8 = canal8;
            
            canal9 = obj.CalculaValorAlfa(CH9);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal9 = canal9
            
            canal10 = obj.CalculaValorAlfa(CH10);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal10 = canal10;
            
            canal11 = obj.CalculaValorAlfa(CH11);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal11 = canal11;
            
            canal12 = obj.CalculaValorAlfa(CH12);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal12 = canal12;
            
            canal13 = obj.CalculaValorAlfa(CH13);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal13 = canal13;
            
            canal14 = obj.CalculaValorAlfa(CH14);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal14 = canal14;
            
            canal15 = obj.CalculaValorAlfa(CH15);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal15 = canal15;
            
            canal16 = obj.CalculaValorAlfa(CH16);
            
            obj.matriz_alfa(length(obj.matriz_alfa)).canal16 = canal16;
            obj.matriz_alfa(length(obj.matriz_alfa)).Label = Label;
            
            featTable = struct2table(obj.matriz_alfa);
        end
        
        function featTable = generateFeatures (obj,data)
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
    end
end
