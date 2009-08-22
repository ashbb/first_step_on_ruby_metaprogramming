# datarecord.rb
# step3
#
# - add the following function to the `make` method written in step2
# - read values from `peoples.txt`
# - create instance and assign values to corresponding variables
# - return all instances created
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
  
  lines.collect do |line|
    klass.new( *eval("[#{line}]"))
  end
end

# Hint: eval