classdef Dataset
    properties
        trials;
        trials10;
        data_filtered;
    end
    
    methods
        function obj = Dataset()
        end
        
        function obj = addTrial(obj, name, marker)
            trial = obj.readTrial(name, marker);
            obj.trials(length(obj.trials)+1).trial = trial; 
            obj.trials(length(obj.trials)).marker = marker;
            
            trial10 = obj.readTrials(name, marker);
            for i = 1 : length(trial10)
            obj.trials10(length(obj.trials10)+1).trial10 = trial10{i};
            obj.trials10(length(obj.trials10)).marker = marker;
            end
            
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
           
           function trial10 = readTrials(obj, name, marker)
                csv = csvread(name);
                vector = csv(17,:);
                position = find(vector == marker, 1);
                position_int = position(1,1);
                position_int2 = position_int+((125*2));
                position_int3 = position_int2+(125*2);
                position_int4 = position_int3+(125*2);
                position_int5 = position_int4+(125*2);
                position_int6 = position_int5+(125*2);
                position_int7 = position_int6+(125*2);
                position_int8 = position_int7+(125*2);
                position_int9 = position_int8+(125*2);
                position_int10 = position_int9+(125*2);
                position_int11 = position_int10+(125*2);
                trial10 = {csv(1:16,position_int:position_int2);csv(1:16,position_int2:position_int3);csv(1:16,position_int3:position_int4);csv(1:16,position_int4:position_int5);csv(1:16,position_int5:position_int6);csv(1:16,position_int6:position_int7);csv(1:16,position_int7:position_int8);csv(1:16,position_int8:position_int9);csv(1:16,position_int9:position_int10);csv(1:16,position_int10:position_int11)};

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
                     
                     
                 end
             
   
    end