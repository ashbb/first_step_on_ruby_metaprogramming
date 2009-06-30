Exercise 2
----------
Add your code to display 'I like metaprogramming.'


	class I
	  def like arg
	    puts "%s %s %s" % [self.class, self.class.instance_methods(false), arg]
	  end
	end
	
	c, m, arg = gets.split  # input 'I like metaprogramming.'
	 
	# write your code here to display 'I like metaprogramming.'
	 

Hints: const_get, send

