Cheat Sheet
===========

<br>

1. inherited() - a hook method
------------------------------

The mechanical explanation is that the superclass knows if/when it is inherited by another class and can do something about it. 

Ummm.. okay, but give me at least one example (even if that is not the full story) of why that allows you to do something otherwise not possible or why it is more elegant. 

In the video we watched as part of this course, there was this example. 

If I understand correctly, this allows an elegant way to set a **class instance variable**. Elegant in the sense that very little code exists at the subclass level (which is what the user will write, the superclass is framework). 

The superclass not only contains the bulk of the code but also establishes a convention. In theory, each subclass can declare its own class instance variables, e.g. `@table_name = "volumes"` but who would check if you made a typo? By having a method set\_table\_name, it is cleaner cuz typos will be caught at runtime and flagged.

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
	      # Switch self to subclass by explicitly calling
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


Note: This tip was written by **Himansu Desai**. Thx!
