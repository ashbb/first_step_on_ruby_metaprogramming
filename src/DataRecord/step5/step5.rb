# step4.rb
require 'datarecord'

klass = Datarecord.make 'customers.txt'
p klass  #=> Customers
klass.read.each{|people| p people}

#=> #<Customers:0x2dd460c @tel=2234, @ID="A-23-112", @name="Satoshi", @last_access="Aug 13th", @account="ashbb">
    #<Customers:0x2dd42ec @tel=5543, @ID="B-34-122", @name="Satish", @last_access="May 1st", @account="tiger">
    #<Customers:0x2dd3fcc @tel=7812, @ID="A-15-982", @name="Michael", @last_access="Sep 24th", @account="pen">