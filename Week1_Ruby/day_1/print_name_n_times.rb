#!/usr/bin/ruby -w

# Print your name ten times.
# Aaaand, print the string with number of iteration.

puts 'What is your name?'

name = gets.chomp

n = 10

# Есть рекомендация, которая гласит, что вместо for лучше использовать each
(1..n).each do |i|
  puts "#{i}: Your name is #{name}"
end
