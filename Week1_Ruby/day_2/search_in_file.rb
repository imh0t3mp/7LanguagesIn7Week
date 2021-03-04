#!/usr/bin/env ruby

# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do a simple
# regular expression match and read lines from a file. (This is surprisingly
# simple in Ruby.) If you want, include line numbers.

puts 'Что ищем?'

grep_word = gets.chomp

File.open(File.dirname(__FILE__) + '/banana_cake.txt') do |cake_recipy|
  cake_recipy.each_line.each_with_index do |row, i|
    puts "[#{i + 1}] #{row}" if row =~ Regexp.new(grep_word)
  end
end
