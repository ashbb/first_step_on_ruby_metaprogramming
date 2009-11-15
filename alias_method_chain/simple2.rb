# simple2.rb

require 'simple1'

class MyClass
  def greet_with_log
    puts "Calling method..."
    puts "Hello!"
    puts "...Method called"
  end
  
  alias_method :greeting_with_log, :greet
  alias_method :greet, :greet_with_log
end

MyClass.new.greet

# => Hello!
#    Calling method...
#    Hello!
#    ...Method called
