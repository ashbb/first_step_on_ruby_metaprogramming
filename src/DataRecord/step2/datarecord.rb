# datarecord.rb
# step2
#
# - add the following function to the `make` method written in step1
# - read first line from the file `people.txt`
# - define instance methods: name, points, country and likes
# - define `initialize` method where the instance variables are set like this
#      @name = name
#
def make file
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
end

# Hint: class_eval, define_method, instance_variable_set
