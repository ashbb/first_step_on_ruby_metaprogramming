# step4.rb
require 'datarecord'

klass = Datarecord.make 'people.txt'
p klass  #=> People
klass.read.each{|people| p people}

#=> #<People:0x2dd4724 @likes="dog", @points=200, @name="sarah", @country="USA">
    #<People:0x2dd447c @likes="cat", @points=140, @name="ashbb", @country="Japan">
    #<People:0x2dd41d4 @likes="tiger", @points=203, @name="satish", @country="India">
    #<People:0x2dd3f2c @likes="elephant", @points=1500, @name="vic", @country="USA">
