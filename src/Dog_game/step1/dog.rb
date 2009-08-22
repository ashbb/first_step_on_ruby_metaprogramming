# dog.rb
MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', 
  :laugh => 'finds this hilarious!'}

class Dog
  def initialize name
    @name = name
  end
  
  #attr_reader :name
  
  def method_missing m
    "#{@name} don't understand #{m}"
  end

  def can *args
    meta = class << self; self; end
    meta.class_eval do
      args.each do |m|
        define_method(m){"#{@name} #{MSGS[m]}"}
      end
    end
  end
end
