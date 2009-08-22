# Exercise 1
# Get the values from outside the class A! 
# Write your code which outputs like this:
# 1
# 2
# 3
# 11
# 22
# 33
#
# class A
#   def initialize
#     @a = 11
#     @@a = 22
#     a = 33
#   end
#   @a = 1
#   @@a = 2
#   a = 3
# end

c = \
class A
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end
  @a = 1
  @@a = 2
  a = 3
end

p A.class_eval('@a')
p A.class_eval('@@a')
p c

obj = A.new
p obj.instance_variable_get(:@a)
p A.send(:class_variable_get, :@@a)
#p A.class_eval('@@a')

class B < A
  def initialize
    @b = super
  end
  attr_reader :b
end

obj = B.new
p obj.b
