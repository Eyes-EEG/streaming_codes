classdef (Abstract) ClassifyList < int32
    methods(Abstract)
        result = enum2str(value);
        result = str2enum(value);
    end
end
