classdef StreamingOpenBCI < BCI
    properties
        cfgPreproc

        buffer;
        bufferSamples;
    end

    methods
        function obj = StreamingOpenBCI(sampleRate, cfgPreproc)
            obj = obj@BCI();
            
            secs = 2;
            obj.bufferSamples = secs * sampleRate;
            
            obj.buffer = [];
            obj.cfgPreproc = cfgPreproc;
        end

        function obj = classifyStreaming(obj)
            lib = lsl_loadlib();

            disp('Resolving an EEG stream...');
            result = {};
            while isempty(result)
                result = lsl_resolve_byprop(lib, 'type', 'EEG');
            end

            % Create a new inlet
            disp('Opening an inlet...');
            inlet = lsl_inlet(result{1});

            while true
                obj = obj.readStreaming(inlet);

                [~, numSampBuffer] = size(obj.buffer);
                if(numSampBuffer >= obj.bufferSamples)
                    
                    csvwrite('.\Records\bufferOpenBCI.csv', obj.buffer);
                    data = Dataset([], obj.cfgPreproc);
                    data = data.addAllFile('bufferOpenBCI');

                    obj.classifyAndSend(data);
                    
                    obj.buffer = obj.buffer(:, end - (obj.bufferSamples - 2) : end);
                end
            end
        end

        function obj = readStreaming(obj, inlet)
            disp('Now receiving data...');

            [vec, ~] = inlet.pull_sample();
            obj.buffer = [obj.buffer, vec'];
        end
    end
end
