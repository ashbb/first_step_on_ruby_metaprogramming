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