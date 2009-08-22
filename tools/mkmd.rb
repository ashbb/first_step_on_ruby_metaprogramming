# mkmd.rb

def read_src name
  IO.readlines("../src/" + name).collect{|c| "\t" + c}
end

def insert_src path
  Dir.glob(path).each do |file|
    lines = IO.readlines file
    open(file, 'w') do |f|
      lines.each do |line|
        new_line = line
        line.sub(/^# *(.*\.rb)/){new_line = read_src $1}
        f.puts new_line
      end
    end
  end
end

insert_src "../md/*.md"
