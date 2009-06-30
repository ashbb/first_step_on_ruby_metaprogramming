Exercise 5
----------

Define the following class without <b>class MaskedString</b>,  <b>def tr_vowel</b> and <b>def self.tr_vowel</b>

	class MaskedString < String
	  def tr_vowel
	    tr 'aeiou', '*'
	  end
	  def self.tr_vowel str
	    str.tr 'aeiou', '*'
	  end
	end

Hints: 
- instance\_eval, class\_eval, define\_method
- module, extend, extended
- module, include, included