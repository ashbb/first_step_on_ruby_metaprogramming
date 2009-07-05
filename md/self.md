self
----

Quote from [Programming Ruby 1.9](http://www.pragprog.com/titles/ruby3/programming-ruby-1-9), Chapter 24 Metaprogramming: 

Ruby has the concept of the current object. This current object is referenced by the built-in, read-only variable self. self has two significant roles in a running Ruby program.

<b>First</b>, self controls how Ruby finds instance variables. When you access an instance variable, Ruby looks for it in the object referenced by self.

<b>Second</b>, self plays a vital role in method calling. In Ruby, each method call is made on some object. There's no explicit receiver. In this case, Ruby uses the current object, self, as the receiver. It goes to self's class and looks up the method. Calling a method with an explicit receiver changes self. self is also changed by a class definition.
