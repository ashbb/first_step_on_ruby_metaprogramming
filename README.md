First Step on Ruby Metaprogramming
==================================

<br>

First Week
==========
Let's start learning Ruby Metaprogramming!

<br>
Study 0
-------
At first, review the built-in, read-only variable <b>self</b>

Read the following two articles:

- [self](http://rubylearning.com/satishtalim/ruby_self.html) - The current/default object
- [self](../md/tree/master/self.md) - Quote from Programming Ruby 1.9


<br>
Study 1
-------
Learn about the following methods to read [The Book of Ruby](http://www.sapphiresteel.com/The-Book-Of-Ruby), Chapter 20: Dynamic Programming.

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
Learn about the following singleton class (metaclass) to read \_why's hacking, [Seeing Metaclasses Clearly](http://whytheluckystiff.net/articles/seeingMetaclassesClearly.html).

- class << self; self; end

<br>
Study 3
-------
Learn about the following methods to read Marc-Andre Cournoyer's blog, [Extending your include knowledge of Ruby](http://macournoyer.wordpress.com/2007/07/06/extending-your-include-knowledge-of-ruby/). 
And to read Ruby-Doc Core API: [Module#included](http://www.ruby-doc.org/core/classes/Module.html#M001683) and [Module#extended](http://www.ruby-doc.org/core/classes/Module.html#M001660)

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

- [Exercise 1](../md/tree/master/Exercise_1.md): Get the values from outside the class.
- [Exercise 2](../md/tree/master/Exercise_2.md): Add your code to display 'I like metaprogramming!'
- [Exercise 3](../md/tree/master/Exercise_3.md): Show lots of ways to define singleton method.
- [Exercise 4](../md/tree/master/Exercise_4.md): Glance into Ruby inside with binding method.
- [Exercise 5](../md/tree/master/Exercise_5.md): Define the class without `class` and `def`.

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

Second Week
===========
Well, let's practice how to write a tiny app with Ruby Metaprogramming techniques.

Note: If you have an idea in your mind. Feel free, please show us and try to do that.   

<br>

**Assignment 1**
 
Define class Dog.

<br>
Step 1
------
There are three dogs named Lassie, Fido and Stimpy.   
Look at [dog_game.rb](../md/tree/master/Dog_Step1.md). Expected output is the following:

	"Lassie is dancing"
	"Lassie is a smelly doggy!"
	"Lassie finds this hilarious!"
	
	"Fido don't understand dance"
	"Fido is a smelly doggy!"
	"Fido don't understand laugh"
	
	"Stimpy is dancing"
	"Stimpy don't understand poo"
	"Stimpy don't understand laugh"

Create <b>dog.rb</b> stored the class Dog.

Hints:    
- class Dog has three methods: initialize, can, method_missing
- may be useful to define the static data like this:
  MSGS = {:dance => 'is dancing', :poo => 'is a smelly doggy!', :laugh => 'finds this hilarious!'}


<br>
Step 2
------
Challenge a little bit improving.   

Look at [dog_game.rb](../md/tree/master/Dog_Step2.md). Expected output is the following:

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

Let's improve <b>dog.rb</b>.

Hints:    
- use <b>can</b> method <b>with block</b> like this: <b>stimpy.can(:cry){"#{name} cried AHHHH"}</b>
- define the <b>name</b> method

<br>

<br>


**Assignment 2**

Follow these steps to create a tiny XML generator: <b>xml.rb</b>

We can use it like this:

- Look at [sample_html.rb](../md/tree/master/sample_html.md)
- Need to write <b>XML</b> class with <b>xml_generate()</b> method.
- Line 9-22 is our tiny DSL code to create the output (xml format text). It'll be stored to <b>sample_twitters.html</b> file at the last line.
- Line 4-6 is the input data, just a sample for this practice.
- Look at the output: [sample_twitters.html](../md/tree/master/sample_twitters_html.md) and a [screenshot](../src/XML_generator/step4/sample_twitters.html).

<br>
Step 1
------
Let's start!   
Create two files: <b>sample_html.rb</b> and <b>xml.rb</b>

<b>sample_html.rb</b> has the following features.

- create a XML object
- call <b>xml_generate()</b> method
- at first, the input is only one line: <b>content "Let's start!"</b>
- store the output (created xml)

<br>

<b>xml.rb</b> has the following three instance methods.

- initialize
- content
- xml_generate

<br>

<b>Hint:</b> instance_eval

<br>

Look at the [input and output](../md/tree/master/XML_Step1.md) for Step 1.

<br>
Step 2
------
Improve to accept the following inputs.

	html do
	  body do
	    content "Let's start!"
	  end
	end

<br>

<b>Hint:</b> method_missing

<br>

Look at the [input and output](../md/tree/master/XML_Step2.md) for Step 2.

<br>
Step 3
------
Improve to accept the following inputs.

	html do
	  body do
	    content "Let's start!"
	    form :action => '/page', :method => 'post' do
	      input :type => 'text', :name => 'str', :maxlength => 3, :size => 3
	      input :type => 'submit', :value => 'page'
	    end
	  end
	end

<br>

<b>Hint:</b> hash

<br>

Look at the [input and output](../md/tree/master/XML_Step3.md) for Step 3.

<br>
Step 4
------
Improve to accept the following inputs.   
Use [this pic](../src/XML_generator/step4/b-satoshi.jpg) as a avatar.

	html do
	  body do
	    twitters.each do |tw|
	      img :src => tw.avatar, :alt => tw.name, :width => 25, :height => 25
	      content [" : " , tw.text]
	      br
	      br
	    end
	    form :action => '/page', :method => 'post' do
	      input :type => 'text', :name => 'str', :maxlength => 3, :size => 3
	      input :type => 'submit', :value => 'page'
	    end
	  end
	end

<br>

<b>Hint:</b> no need to use any more metaprogramming tech.

<br>

Look at the [input and output](../md/tree/master/XML_Step4.md) for Step 4.

<br>
Step 5
------
Want to replace <b>XML.new.xml_generate</b> to <b>XML.generate</b>.

<br>

<b>Hint:</b> define class method

<br>

<b>Let's discuss about your code in the relevant thread in the Second Week Forum.</b>

<br>

For More Study
==============
Try to hack the Sample Apps on [Ruby Metaprogramming Study Note](http://github.com/ashbb/ruby_metaprogramming_study_note/tree/master)


<br>
Interesting Articles
--------------------

- [Using method_missing and respond_to? to create dynamic methods](http://technicalpickles.com/posts/using-method_missing-and-respond_to-to-create-dynamic-methods)
- [Ola Bini's blogs on Meta programming](http://ola-bini.blogspot.com/search/label/metaprogramming)

<br>
Note
----
There are a few more useful hook methods for metaprogramming.

- inherited
- method\_added

I'd like to exercise them at the next batch. ;-)

<br><br>

--------
2009.6.30 Satoshi Asakawa
