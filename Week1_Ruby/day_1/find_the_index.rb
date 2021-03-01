#!/usr/bin/ruby -w

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
str = 'Hello, Ruby'
find = 'Ruby'

index = str.index(find)

puts "#{find} в строке \"#{str}\" на позиции #{index}"
