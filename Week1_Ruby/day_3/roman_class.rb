#!/usr/bin/env ruby
# The class converts roman numbers to it arabic
# This class uses method_missing functionality method to convert roman
# style nubers to the style we're used to.

class Roman
  def self.method_missing(name, *_args)
    roman = name.to_s
    # puts "Roman: #{name}"
    roman.gsub!('IV', 'IIII')
    roman.gsub!('IX', 'VIIII')
    roman.gsub!('XL', 'XXXX')
    roman.gsub!('XC', 'LXXXX')

    (roman.count('I') +
      roman.count('V') * 5 +
      roman.count('X') * 10 +
      roman.count('L') * 50 +
      roman.count('C') * 100
    )
  end
end

puts Roman.I
puts Roman.II
puts Roman.VI
puts Roman.X
puts Roman.XII
puts Roman.LLCXII
