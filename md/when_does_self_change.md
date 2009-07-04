When does self change?
----------------------

Only two things can change **self**

- method call (when you call method)

- class/module definition

*Quote from [The Ruby Object Model](http://scotland-on-rails.s3.amazonaws.com/2A04_DaveThomas-SOR.mp4) by Dave Thomas.

---------------

Paolo Perrotta (\*1) answered the question about `self` in the trial beta course forum.

The point is not whether self has a meaning or not--it always does. The point is when the code is evaluated. Here's an example, slightly edited:

	# self_explanation.rb
	
	animal = "duck"
	 
	# We're at the top level here, so self is the main object.
	self                # => main
	 
	class << animal
	  # We just entered the eigenclass (or "singleton class") of animal.
	  # In here, self is the eigenclass:
	  self      # => #<Class:#<String:0x6194c8>>
	 
	  # Let's call module_eval() on the eigenclass:
	  self.module_eval do
	    # This didn't change self:
	    self      # => #<Class:#<String:0x6194c8>>
	 
	    # This method is defined as an instance method
	    # of the eigenclass (a "singleton method").
	    # The code in the method is not executed until we eventually
	    # call the method.
	    def speak_c; self.capitalize; end
	  end
	end
	 
	# OK, now let's call speak_c(). In the method,
	# self is always the receiver object, so writing
	# self.capitalize() is the same as simply writing
	# capitalize():
	animal.speak_c    # => "Duck"


\*1: Author of the upcoming **Metaprogramming Ruby** by the Pragmatic Programmers.

