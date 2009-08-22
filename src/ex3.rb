# Exercise 3
# There are lots of ways to define singleton method.
# 
# animal = 'dog'
# # define singleton speak() method
# animal.speak  #=> 'Dog says Woof!'
# 
# Write your codes and post them here. Let's discuss about them.
# 
# Hints: 
# - def aninal.speak
# - singleton class
# - define_method
# - instance_eval
# - module, extend
# - module, include
# - send, lambda
# - Evaluating Code in the Context of an Object

# -----------------------------------------
animal = 'dog'
def animal.speak
  puts "#{self} says Woof!"
end
animal.speak

# -----------------------------------------
animal = 'cat'
class << animal
  def speak
    puts "#{self} says Meow!"
  end
end
animal.speak

# -----------------------------------------
animal = 'sheep'
class << animal
  define_method :speak do
    puts "#{self} says Bar!"
  end
end
animal.speak

# -----------------------------------------
animal = 'bird'
meta = class << animal; self; end
meta.instance_eval do
  define_method :speak do
    puts "#{self} says Phew!"
  end
end
animal.speak

# -----------------------------------------
module Mod
  def speak
    puts "#{self} says Pppp!"
  end
end

animal = 'panda'
animal.extend Mod
animal.speak

# -----------------------------------------
module Mod
  def speak
    puts "#{self} says Wooo!"
  end
end

animal = 'snake'
class << animal
  include Mod
end
animal.speak

# -----------------------------------------
animal = 'pig'
class << animal
  blk = lambda{puts "#{self} says Boo!"}
  send :define_method, :speak, &blk
end
animal.speak

# -----------------------------------------
animal = 'turtle'
animal.instance_eval <<EOT
  def speak
    puts "#{animal} says Bar!"
  end
EOT

animal.speak

# -----------------------------------------
animal = 'tiger'
animal.instance_eval "
  def speak
    puts \"#{animal} says Bar!\"
  end"

animal.speak