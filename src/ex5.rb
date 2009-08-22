# Exercise 5
# Define the following class without `class MaskedString`,  `def tr_vowel` and `def self.tr_vowel`
# 
# class MaskedString < String
#   def tr_vowel
#     tr 'aeiou', '*'
#   end
#   def self.tr_vowel str
#     str.tr 'aeiou', '*'
#   end
# end
# 
# Hints: 
# - instance_eval, class_eval, define_method, (const_set)
# - module, extend, extended
# - module, include, included

#--------------------------------------------------------
MaskedString1 = Class.new(String)
MaskedString1.class_eval do
  define_method :tr_vowel do
    tr 'aeiou', '*'
  end
end

class << MaskedString1; self; end.
  instance_eval do
    define_method :tr_vowel do |str|
      str.tr 'aeiou', '*'
    end
  end

p MaskedString1.new('Satoshi').tr_vowel
p MaskedString1.tr_vowel('Michael')

#--------------------------------------------------------
module Mod1
  define_method :tr_vowel do
    tr 'aeiou', '*'
  end
  
  def self.included obj
    obj.extend Mod2
  end
  
  module Mod2
    define_method :tr_vowel do |str|
      str.tr 'aeiou', '*'
    end
  end
end

MaskedString2 = Class.new(String)
MaskedString2.class_eval do
  include Mod1
end

p MaskedString2.new('Satoshi').tr_vowel
p MaskedString2.tr_vowel('Michael')

#--------------------------------------------------------
module Mod1
  define_method :tr_vowel do |str|
    str.tr 'aeiou', '*'
  end
  
  def self.extended obj
    obj.class_eval{include Mod2}
  end
  
  module Mod2
    define_method :tr_vowel do
      tr 'aeiou', '*'
    end
  end
end

MaskedString3 = Class.new(String)
MaskedString3.extend Mod1

p MaskedString3.new('Satoshi').tr_vowel
p MaskedString3.tr_vowel('Michael')