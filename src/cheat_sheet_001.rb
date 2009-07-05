# cheat_sheet_001.rb

module ActiveRecord
  class Base
    def self.set_table_name(new_name)
    
      # This is a class inst var and not an inst var
      # because it is a class method (self.xxx)
      # When this method is called, we want self to be the subclass 
      # and not Base class in order for this to work
    
      @table_name = new_name
    end

    def self.inherited(subcls)
      name = subcls.name.downcase + 's'
      
      # At this point, self is Base
      # Swith self to subclass by explicitly calling
      # set_table_name on subclass
      
      subcls.set_table_name(name)
    end
  end
end

class Book < ActiveRecord::Base
  set_table_name "volumes"
end

p Book.instance_variables                    #=> ["@table_name"]
p Book.instance_variable_get(:@table_name)   #=> "volumes"
