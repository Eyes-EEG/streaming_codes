classdef ClientConnection
    properties
        connection
    end
    
    methods
        function obj = ClientConnection(host, port, networkRole)
            obj.connection = tcpip(host, port, 'NetworkRole', networkRole);
            set(obj.connection, 'Timeout', 30);
        end
        
        function openConnection(obj)
            fopen(obj.connection);
        end
        
        function sendAction(obj, action)
            obj.openConnection();
            fwrite(obj.connection, action);
            obj.closeConnection();
        end
        
        function closeConnection(obj)
            fclose(obj.connection);
        end
    end
end
