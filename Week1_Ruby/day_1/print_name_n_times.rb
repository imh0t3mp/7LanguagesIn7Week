#!/usr/bin/env ruby -w

# Print your name ten times.
# Aaaand, print the string with number of iteration.

puts 'What is your name?'

name = gets.chomp

n = 10
for i in 1..n do
  puts "#{i}: Your name is #{name}"
end
