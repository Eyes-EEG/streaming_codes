classdef Actions < ClassifyList
   enumeration
      OpenEyes(1)
      CloseEyes(2)
      LeftEye(3)
      RightEye(4)
   end

   methods (Static)
       function result = enum2str(value)
           switch(value)
               case Actions.Left
                   result = 'Left Eye  ';
               case Actions.Right
                   result = 'Right Eye ';
               case Actions.OpenEyes
                   result = 'Open Eyes ';
               case Actions.CloseEyes
                   result = 'Close Eyes';
               case Actions.Unknown
                   result = 'Unknown   ';
           end
       end

       function result = str2enum(value)
           switch(value)
               case 'Left Eye   '
                   result = Actions.Left;
               case 'Left Eye'
                   result = Actions.Left;
               case 'Right Eye  '
                   result = Actions.Right;
               case 'Right Eye'
                   result = Actions.Right;
               case 'Open Eyes '
                   result = Actions.OpenEyes;
               case 'Open Eyes'
                   result = Actions.OpenEyes;
               case 'Close Eyes'
                   result = Actions.CloseEyes;
               case 'Unknown   '
                   result = Actions.Unknown;
           end
        end
   end
end
