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
            newPrediction = Features();
            newPrediction = newPrediction.generateFeatures (data);
            
            result = obj.trainedClassifier.predictFcn(newPrediction);
        end
        
    end
end
