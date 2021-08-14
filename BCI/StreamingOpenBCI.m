classdef StreamingOpenBCI < BCI
    properties
        

        bufferSamples;
        boardShim;
    end

    methods
        function obj = StreamingOpenBCI(secs, sampleRate)
            obj = obj@BCI();
            BoardShim.set_log_file('brainflow.log');
            BoardShim.enable_dev_board_logger();

            params = BrainFlowInputParams();
            obj.boardShim = BoardShim(int32(BoardIDs.CYTON_DAISY_BOARD), params);

            obj.bufferSamples = secs * sampleRate;

           
        end

        function obj = classifyStreaming(obj)
            obj = obj.openConnection();
            obj = obj.initBoard();

            while true
                data = obj.getData();

                action = obj.classify(data);
                obj.sendCommand(int32(action));

                pause(2);
            end

            obj = obj.stopBoard();
            obj = obj.closeConnection();
        end

         function obj = classifyStreamingSim(obj)
            obj = obj.initBoard();

            while true
                data = obj.getData();

                obj = obj.openConnection();
                action = obj.classify(data);
                obj.sendCommand(int2str(int32(action)));
                obj = obj.closeConnection();

                pause(2);
            end

            obj = obj.stopBoard();
         end

         function obj = initBoard(obj)
             obj.boardShim.prepare_session();
             obj.boardShim.start_stream(45000, '');
             pause(3);
         end

         function data = getData(obj)
             streamingData = obj.boardShim.get_current_board_data(obj.bufferSamples);
             streamingData = streamingData(2:17,:);

             csvwrite('.\Records\bufferOpenBCI.csv', streamingData);
             data = Dataset();
             data = data.addAllFile('bufferOpenBCI.csv');
         end

         function obj = stopBoard(obj)
             obj.boardShim.stop_stream();
             obj.boardShim.release_session();
         end
    end
end
