classdef ClassifiersManager
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Classifier class                       %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties
        trainedClassifier
        accuracy
    end
    
    methods
        function obj = ClassifiersManager()
            
        end
        
        function obj = train(obj, features)
            [obj.trainedClassifier, obj.accuracy] = trainClassifier(features);
            
        end
        
        function result = classify(obj, data)

            result = obj.trainedClassifier.predictFcn(data);
        end
        
    end
end
