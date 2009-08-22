# datarecord.rb
# step4
#
# - write `Datarecord` class to wrap the methods
# - which include `make` method written in step2
# - define `read` class method for People class in the `make` method
# - which get data from `people.txt` and create instances
# - edit `make` method to return class People
# 
class Datarecord
  def self.make file
    class_name = File.basename(file, '.txt').capitalize
    klass = Object.const_set class_name, Class.new
    lines = IO.readlines file
    names = lines.shift.split(',').collect{|e| e.strip}
    
    klass.class_eval do
      attr_reader *names
      define_method :initialize do |*args|
        names.each_with_index do |name, i|
          instance_variable_set "@#{name}", args[i]
        end
      end
    end
    
    class << klass
      define_method :read do
        lines = IO.readlines "#{self.to_s.downcase}.txt"
        lines.shift
        lines.collect do |line|
          self.new( *eval("[#{line}]"))
        end
      end
    end
  
    klass
  end
end
