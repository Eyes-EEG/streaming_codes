classdef Characteristics
    properties
        matriz_alfa;
    end
    
    methods
        function obj = Characteristics()
        end
        
        function obj = addAlfaValue (obj,chanel1, chanel2, chanel3, chanel4, chanel5, chanel6, chanel7, chanel8, chanel9, chanel10, chanel11, chanel12, chanel13, chanel14, chanel15, chanel16, Label)
            canal1 = obj.CalculaValorAlfa(chanel1);
            obj.matriz_alfa(length(obj.matriz_alfa)+1).canal1 = canal1;
            
            canal2 = obj.CalculaValorAlfa(chanel2);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal2 = canal2;
            
            canal3 = obj.CalculaValorAlfa(chanel3);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal3 = canal3;
            
            canal4 = obj.CalculaValorAlfa(chanel4);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal4 = canal4;
            
            canal5 = obj.CalculaValorAlfa(chanel5);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal5 = canal5;
            
            canal6 = obj.CalculaValorAlfa(chanel6);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal6 = canal6;
            
            canal7 = obj.CalculaValorAlfa(chanel7);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal7 = canal7;
            
            canal8 = obj.CalculaValorAlfa(chanel8);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal8 = canal8;
            
            canal9 = obj.CalculaValorAlfa(chanel9);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal9 = canal9
            
            canal10 = obj.CalculaValorAlfa(chanel10);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal10 = canal10;
            
            canal11 = obj.CalculaValorAlfa(chanel11);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal11 = canal11;
            
            canal12 = obj.CalculaValorAlfa(chanel12);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal12 = canal12;
            
            canal13 = obj.CalculaValorAlfa(chanel13);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal13 = canal13;
            
            canal14 = obj.CalculaValorAlfa(chanel14);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal14 = canal14;
            
            canal15 = obj.CalculaValorAlfa(chanel15);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal15 = canal15;
            
            canal16 = obj.CalculaValorAlfa(chanel16);
            obj.matriz_alfa(length(obj.matriz_alfa)).canal16 = canal16;
            obj.matriz_alfa(length(obj.matriz_alfa)).Label = Label;
        end
        
        function canal1 = CalculaValorAlfa (obj,chanel1)
                sampling_rate = 125;
                nfft = DataFilter.get_nearest_power_of_two(sampling_rate);
                original_data = chanel1;
                detrended = DataFilter.detrend(original_data, int32(DetrendOperations.LINEAR));
                [ampls, freqs] = DataFilter.get_psd_welch(detrended, nfft, nfft / 2, sampling_rate, int32(WindowFunctions.HANNING));
                canal1 = DataFilter.get_band_power(ampls, freqs, 7.0, 13.0);
        end
    end
end