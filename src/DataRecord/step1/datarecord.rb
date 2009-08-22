# datarecord_step1.rb
# step1
#
#  - write `make` method
#  - which defines People class using file name `people.txt`
#
def make file
  class_name = File.basename(file, '.txt').capitalize
  Object.const_set class_name, Class.new
end

# Hint: const_set, Class.new
