require 'datarecord'

make 'people.txt'
p Module.constants.grep(/Pe/)  #=> ["People"]
p People.class  #=> Class

