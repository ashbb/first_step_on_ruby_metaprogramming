# step2.rb
require 'datarecord'
make 'people.txt'
p People.instance_methods(false)  #=> ["likes", "points", "name", "country"]
p People.new('satoshi', 100, 'UK', 'monkey')
#=> #<People:0x2b81684 @name="satoshi", @country="UK", @likes="monkey", @points=100>


