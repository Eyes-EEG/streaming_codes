classdef Dataset
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % This class save and filter the data.   %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties
        data_filtered;
    end
    
    methods (Access = public)
        function obj = Dataset()    
        end
        
        function obj = addTrial(obj, name, marker)
            trial = obj.readTrial(name, marker);
            
            filtered_data = obj.filtrado(trial);
            for i =1:length(filtered_data)
            obj.data_filtered(length(obj.data_filtered)+1).filtered_data = filtered_data{i};
            obj.data_filtered(length(obj.data_filtered)).marker = marker;
            end
            
         end
            
         function trial = readTrial(obj, name, marker)
                csv = csvread(name);
                vector = csv(17,:);
                position = find(vector == marker, 1);
                position_int = position(1,1);
                position_int2 = position_int+((125*20));
               
                trial = csv(1:16,position_int:position_int2);

          end
          
          function filtered_data = filtrado(obj, trial)
                     original_data1 = trial(1:16,1:251);
                     original_data2 = trial(1:16,251:501);
                     original_data3 = trial(1:16,501:751);
                     original_data4 = trial(1:16,751:1001);
                     original_data5 = trial(1:16,1001:1251);
                     original_data6 = trial(1:16,1251:1501);
                     original_data7 = trial(1:16,1501:1751);
                     original_data8 = trial(1:16,1751:2001);
                     original_data9 = trial(1:16,2001:2251);
                     original_data10 = trial(1:16,2251:2501);
                     
                     sampling_rate = 125;
                     
                     filtered_data = {DataFilter.perform_bandpass(original_data1, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data2, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data3, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data4, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data5, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data6, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data7, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data8, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data9, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);DataFilter.perform_bandpass(original_data10, sampling_rate, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0)};
                     
            end
            
            function data = addAllFile(obj, StreamingFile)
                        csvstream = csvread(StreamingFile);
                        
                        data = DataFilter.perform_bandpass(csvstream, 125, 15.25, 25.5, 3, int32(FilterTypes.BUTTERWORTH), 0.0);
                    
            end

        
    end
end
