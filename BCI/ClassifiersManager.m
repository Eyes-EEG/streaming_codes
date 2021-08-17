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
        
        function result = classify(obj, features)
            result = obj.trainedClassifier.predictFcn(features);
        end
        
    end
end
