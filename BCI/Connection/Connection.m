classdef Connection
    properties
        connection
    end

    methods
        function obj = Connection(host, port, role)
            obj.connection = tcpip(host, port, 'NetworkRole', role);
            set(obj.connection, 'Timeout', 30);
        end

        function openConnection(obj)
            fopen(obj.connection);
        end

        function sendAction(obj, action)
            fwrite(obj.connection, action);
        end

        function closeConnection(obj)
            fclose(obj.connection);
        end
    end
end
