classdef (Abstract) BCI
    properties
        features;
        manager;
        
        clientConnection;
    end

    methods
        function obj = BCI()
            obj.clientConnection = ...
                ClientConnection('127.0.0.1', 55001, 'Client');
            
            %% Bi
            obj.manager = ClassifiersManager();
        end
        
        function obj = train(obj, data)
            [obj, features] = obj.generateModelFeatures(data);
            obj.manager = obj.manager.train(features);
        end
    end
    
    methods (Access = protected)
        function featTable = generateFeatures(obj, data)
            features = Features();
            featTable = features.generateFeatures(data);
        end

        function [obj, featTable] = generateModelFeatures(obj, data)
            obj.features = Features();
            [obj.features, featTable] = obj.features.generateFeatures(data);
        end
        
        function classifyAndSend(obj, data)
            features = obj.generateFeatures(data);
            action = obj.manager.classify(features);
            obj.sendCommand(action)
        end
        
        function sendCommand(obj, action)
            action = int2str(int32(action));
            disp(strcat('Action: ', action))
            % obj.clientConnection.sendAction(action);
        end
    end
    
end
