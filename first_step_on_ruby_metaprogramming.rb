# first_step_on_ruby_metaprogramming.rb
require 'sinatra'

get '/' do
  IO.read './html/Ruby_Metaprogramming.html'
end

Dir.glob("./html/*.html").each do |path|
  hfile = '/html/' + File.basename(path)
  get hfile do
    IO.read('.' + hfile)
  end
end
