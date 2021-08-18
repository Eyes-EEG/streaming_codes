classdef (Abstract) BCI
    properties
        features;
        manager;

        extConnection;
    end

    methods
        function obj = BCI()
            obj.extConnection = ...
                Connection('127.0.0.1', 55001, 'Client');
%             obj.extConnection = ...
%                 Connection('0.0.0.0', 3377, 'Server');

            obj.manager = ClassifierManager();
        end

        function obj = train(obj, Datos_filtrados, Label)
            for i = 1 : length(Datos_filtrados)
                [obj, features] = obj.generateModelFeatures(Datos_filtrados{i}, Label(i));
            end
            obj.manager = obj.manager.train(features);
            
        end
    end

    methods (Access = protected)
        function featTable = generateFeatures(obj, data)
            features = Features();
            featTable = features.generateFeatures(data);
        end

        function [obj, featTable] = generateModelFeatures(obj, Datos_filtrados, Label)
            obj.features = Features();
            for i = 1 : length(Datos_filtrados)
                [obj.features, featTable] = obj.features.generateModelFeatures(Datos_filtrados{i}, Label(i));
            end
             
        end

        function action = classify(obj, data)
            for i = 1 : length(Datos_filtrados)
                [obj, modelfeatures] = obj.generateModelFeatures(Datos_filtrados{i}, Label(i));
            end
            features = obj.generateFeatures(data);
            action = obj.manager.classify(modelfeatures, features);
            disp(['Action: ' Actions.enum2str(action)]);
        end

        function sendCommand(obj, action)
            obj.extConnection.sendAction(action);
        end

        function obj = openConnection(obj)
            obj.extConnection.openConnection();
        end

        function obj = closeConnection(obj)
            obj.extConnection.closeConnection();
        end
    end
end
