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
        newPredict = Features();
        newPredict = newPredict.generateFeatures(data);
        
        result = obj.trainedClassifier.predictFcn(newPredict);
        end
        
    end
end
