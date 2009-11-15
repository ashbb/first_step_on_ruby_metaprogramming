First Step on Ruby Metaprogramming
==================================

<br><br>

--------

First Week
==========
Let's start learning Ruby Metaprogramming!

<br>

Study 0
-------
1st, review the built-in, read-only variable <b>self</b>. Read the following articles:

- [self](http://rubylearning.com/satishtalim/ruby_self.html) - The current/default object
- [self](../html/self.html) - Quote from Programming Ruby 1.9

- [When does self change?](../html/when_does_self_change.html) - Quote from The Ruby Object Model

2nd, review <b>singleton class</b>. Read the following article:

- [Understanding Ruby Singleton Classes](http://pmade.com/articles/2008/ruby-singleton)

3rd, review the <b>scope of variables</b>. Read the following article:

- [Ruby Variable Scope](http://www.techotopia.com/index.php/Ruby_Variable_Scope)

<br>
Study 1
-------
To learn about the following methods read  [The Book of Ruby](http://www.sapphiresteel.com/The-Book-Of-Ruby), Chapter 20: Dynamic Programming.

- eval
- instance_eval
- class\_eval (aka: module_eval)
- class\_variable\_set
- class\_variable\_get
- class\_variables (Try it out: instance\_variables)
- instance\_variable\_set (Try it out: instance\_variable\_get)
- define\_method
- const\_set
- const\_get (Try it out: constants)
- Class.new (Try it out: Struct.new)
- binding (Try it out: lambda)
- send (Try it out: method)
- remove\_method
- undef\_method
- method\_missing

<br>
Study 2
-------
Read \_why's hacking, [Seeing Metaclasses Clearly](../html/seeingMetaclassesClearly.html) to learn about the following singleton class (metaclass)

- class << self; self; end

<br>
Study 3
-------
Read Marc-Andre Cournoyer's blog, [Extending your include knowledge of Ruby](http://macournoyer.wordpress.com/2007/07/06/extending-your-include-knowledge-of-ruby/) to learn about the following methods. 
Also read Ruby-Doc Core API: [Module#included](http://www.ruby-doc.org/core/classes/Module.html#M001683) and [Module#extended](http://www.ruby-doc.org/core/classes/Module.html#M001660)

- include
- extend
- included
- extended

<br>
Before Exercises
----------------
Watch the following presentation, [the Scotland on Rails conference 2009](http://www.rubyinside.com/scotland-on-rails-presentations-now-online-27-awesome-videos-1799.html), by Dave Thomas.

[The Ruby Object Model](http://scotland-on-rails.s3.amazonaws.com/2A04_DaveThomas-SOR.mp4)

<br>
Exercises
---------
Try to do the following exercises. Let's discuss all these exercises in the relevant thread in the First Week Forum.

- [Exercise 1](../html/Exercise_1.html): Get the values from outside the class.
- [Exercise 2](../html/Exercise_2.html): Add your code to display 'I like metaprogramming!'
- [Exercise 3](../html/Exercise_3.html): Show lots of ways to define singleton method.
- [Exercise 4](../html/Exercise_4.html): Glance into Ruby inside with binding method.
- [Exercise 5](../html/Exercise_5.html): Define the class without `class` and `def`.

<br>
Watch the video
---------------
Watch the Dave Thomas's presentation about Metaprogramming.

[MetaProgramming - Extending Ruby for Fun and Profit](http://www.infoq.com/presentations/metaprogramming-ruby)

Understand these concepts:

- Classes are open
- Definitions are active
- All method calls have a receiver
- Classes are objects

<br>
Cheat Sheet
-----------

- [Cheat Sheet](../html/cheat_sheet.html): a list of Ruby metaprogramming techniques

<br><br>

--------

Second Week
===========
Well, let's practice how to write a tiny app with Ruby Metaprogramming techniques.

Note: If you have an idea in your mind. Feel free, please show us and try to do that.   

<br>

Assignment 1
------------

Define class Dog.

<br>

Step 1
------
There are three dogs named Lassie, Fido and Stimpy.   
Look at [dog_game.rb](../html/Dog_Step1.html). Expected output is the following:

	"Lassie is dancing"
	"Lassie is a smelly doggy!"
	"Lassie finds this hilarious!"
	
	"Fido doesn't understand dance"
	"Fido is a smelly doggy!"
	"Fido doesn't understand laugh"
	
	"Stimpy is dancing"
	"Stimpy doesn't understand poo"
	"Stimpy doesn't understand laugh"

Create <b>dog.rb</b> stored the class Dog.

**Hints:**

- class Dog has three methods: initialize, can, method_missing
- may be useful to define the static data like this:
  MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}


<br>
Step 2
------
Challenge: Improve a little bit.   

Look at [dog_game.rb](../html/Dog_Step2.html). Expected output is the following:

	"Lassie is dancing"
	"Lassie is a smelly doggy!"
	"Lassie finds this hilarious!"
	
	"Fido doesn't understand dance"
	"Fido is smelly."
	"Fido doesn't understand laugh"
	
	"Stimpy is dancing"
	"Stimpy doesn't understand poo"
	"Stimpy doesn't understand laugh"
	"Stimpy cried AHHHH"

Let's improve <b>dog.rb</b>.

<b>Hints:</b>

- use <b>can</b> method <b>with block</b> like this: <b>stimpy.can(:cry){"#{name} cried AHHHH"}</b>
- define the <b>name</b> method

<br>

<br>


Assignment 2
------------

Follow these steps to create a tiny Data Record program: <b>datarecord.rb</b>

We can use it like this:

	require 'datarecord'
	klass = Datarecord.make 'people.txt'
	klass.read.each{|people| p people}

Output is:

	#<People:0x2dd4724 @likes="dog", @points=200, @name="sarah", @country="USA">
	#<People:0x2dd447c @likes="cat", @points=140, @name="ashbb", @country="Japan">
	#<People:0x2dd41d4 @likes="tiger", @points=203, @name="satish", @country="India">
	#<People:0x2dd3f2c @likes="elephant", @points=1500, @name="vic", @country="USA">

Data of [people.txt](/data/people.txt) is:

	name, points, country, likes
	'sarah', 200, 'USA', 'dog'
	'ashbb', 140, 'Japan', 'cat'
	'satish', 203, 'India', 'tiger'
	'vic', 1500, 'USA', 'elephant'

- The first line of data is a list of attribute names.   
- The second line of data is a list of values.   
- Other lines are the same as the second line.

<br>
Step 1
------
Let's start!   
At first, write <b>make</b> method. Which defines People class using file name <b>people.txt</b>

<br>

<b>step1.rb</b>:

	def make file
	  # add your code here
	end
	
	make 'people.txt'
	p Module.constants.grep(/Pe/)  #=> ["People"]
	p People.class  #=> Class


<br>

<b>Hint:</b> const_set, Class.new

<br>
Step 2
------

Add the following function to the <b>make</b> method written in step1.

- read first line from the file <b>people.txt</b>
- define instance methods: name, points, country and likes
- define <b>initialize</b> method where the instance variables are set like this : <b>@name = name</b>

<br>

<b>step2.rb</b>:

	def make file
	  # add your code here
	end
	
	make 'people.txt'
	p People.instance_methods(false)  #=> ["likes", "points", "name", "country"]
	p People.new('satoshi', 100, 'UK', 'monkey')
	#=> #<People:0x2b81684 @name="satoshi", @country="UK", @likes="monkey", @points=100>
	
<br>

<b>Hint:</b> class\_eval, define\_method, instance\_variable\_set

<br>
Step 3
------
Add the following function to the <b>make</b> method written in step2.
- read values from <b>peoples.txt</b>
- create instances and assign values to corresponding variables
- return all instances created

<br>

<b>step3.rb</b>:

	def make file
	  # add your code here
	end
	
	make('people.txt').each{|people| p people}
	#=> #<People:0x2dd5048 @country="USA", @likes="dog", @points=200, @name="sarah">
	    #<People:0x2dd4da0 @country="Japan", @likes="cat", @points=140, @name="ashbb">
	    #<People:0x2dd4af8 @country="India", @likes="tiger", @points=203, @name="satish">
	    #<People:0x2dd4850 @country="USA", @likes="elephant", @points=1500, @name="vic">
	
<br>

<b>Hint:</b> eval

<br>
Step 4
------

Write <b>Datarecord</b> class to wrap the following class methods: <b>make</b>, <b>read</b>
- <b>Datarecord</b> class have <b>make</b> method written in step2
- define <b>read</b> class method of People class in the <b>make</b> method
- <b>read</b> get data from <b>people.txt</b> and create instances
- edit <b>make</b> method to return class People

<br>

<b>step4.rb</b>:

	class Datarecord
	  def self.make file
	    # add your code here
	  end
	end
	
	klass = Datarecord.make 'people.txt'
	p klass  #=> People
	klass.read.each{|people| p people}
	#=> #<People:0x2dd4724 @likes="dog", @points=200, @name="sarah", @country="USA">
	    #<People:0x2dd447c @likes="cat", @points=140, @name="ashbb", @country="Japan">
	    #<People:0x2dd41d4 @likes="tiger", @points=203, @name="satish", @country="India">
	    #<People:0x2dd3f2c @likes="elephant", @points=1500, @name="vic", @country="USA">
	

<br>

<b>Hint:</b> get the file name <b>people.txt</b> from the class name <b>People</b>

<br>
Step 5
------

Finally, store your <b>Datarecord</b> class into the file <b>datarecord.rb</b>

Confirm the following. Your code will work very well with no editing. ;-)

<br>

<b>step5.rb</b>:

	require 'datarecord'
	
	klass = Datarecord.make 'customers.txt'
	p klass  #=> Customers
	klass.read.each{|people| p people}
	#=> #<Customers:0x2dd460c @tel=2234, @ID="A-23-112", @name="Satoshi", @last_access="Aug 13th", @account="ashbb">
	    #<Customers:0x2dd42ec @tel=5543, @ID="B-34-122", @name="Satish", @last_access="May 1st", @account="tiger">
	    #<Customers:0x2dd3fcc @tel=7812, @ID="A-15-982", @name="Michael", @last_access="Sep 24th", @account="pen">

<br>

[customers.txt](/data/customers.txt) is here:

	ID, account, tel, last_access, name
	'A-23-112', 'ashbb', 2234, 'Aug 13th', 'Satoshi'
	'B-34-122', 'tiger', 5543, 'May 1st', 'Satish'
	'A-15-982', 'pen', 7812, 'Sep 24th', 'Michael'

<br>

<b>Let's discuss your code in the relevant thread in the Second Week Forum.</b>

<br>

For More Study
==============

- [Ruby Metaprogramming Study Note](http://github.com/ashbb/ruby_metaprogramming_study_note/tree/master) Try to hack the Sample Apps!

- [Spell Book](http://media.pragprog.com/titles/ppmetr/spells.pdf) The excerpt from Metaprogramming Ruby. Collection of Metaprogramming-related small snippets. Useful as a quick reference. For free!


<br>
Interesting Articles
--------------------

- [Using method_missing and respond_to? to create dynamic methods](http://technicalpickles.com/posts/using-method_missing-and-respond_to-to-create-dynamic-methods)

- [Ola Bini's blogs on Meta programming](http://ola-bini.blogspot.com/search/label/metaprogramming)

- [The Ruby Language FAQ](http://www.rootr.net/rubyfaq.html)

- [Trying to define a 'class' without using 'class' sentence](http://www.ruby-forum.com/topic/190407)

- [Ruby Mixin Tutorial](http://juixe.com/techknow/index.php/2006/06/15/mixins-in-ruby/)

- [Evaluation Options in Ruby](http://www.infoq.com/articles/eval-options-in-ruby)

<br>
Recommended Book
----------------

I'd like to hightly recommend this book. ;-)

- [Metaprogramming Ruby](http://www.pragprog.com/titles/ppmetr/metaprogramming-ruby) by [Paolo Perrotta](http://rubylearning.com/blog/2009/07/01/interview-author-paolo-perrotta/)


<br><br>

--------
2009.8.22 Satoshi Asakawa
