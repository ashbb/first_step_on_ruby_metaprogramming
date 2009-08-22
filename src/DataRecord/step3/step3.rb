#step3.rb
require 'datarecord'

make('people.txt').each{|people| p people}
#=> #<People:0x2dd5048 @country="USA", @likes="dog", @points=200, @name="sarah">
    #<People:0x2dd4da0 @country="Japan", @likes="cat", @points=140, @name="ashbb">
    #<People:0x2dd4af8 @country="India", @likes="tiger", @points=203, @name="satish">
    #<People:0x2dd4850 @country="USA", @likes="elephant", @points=1500, @name="vic">

