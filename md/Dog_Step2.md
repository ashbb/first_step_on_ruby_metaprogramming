Step 2: dog_game.rb
-------------------

dog_game.rb
-----------

	# dog_game.rb
	require 'dog'
	
	lassie, fido, stimpy = %w[Lassie Fido Stimpy].collect{|name| Dog.new(name)}
	lassie.can :dance, :poo, :laugh
	fido.can(:poo){"#{name} is smelly."}
	stimpy.can :dance
	stimpy.can(:cry){"#{name} cried AHHHH"}
	
	p lassie.dance
	p lassie.poo
	p lassie.laugh
	puts
	p fido.dance
	p fido.poo
	p fido.laugh
	puts
	p stimpy.dance
	p stimpy.poo
	p stimpy.laugh
	p stimpy.cry


Expected output is:
-------------------

	"Lassie is dancing"
	"Lassie is a smelly doggy!"
	"Lassie finds this hilarious!"
	
	"Fido don't understand dance"
	"Fido is smelly."
	"Fido don't understand laugh"
	
	"Stimpy is dancing"
	"Stimpy don't understand poo"
	"Stimpy don't understand laugh"
	"Stimpy cried AHHHH"

