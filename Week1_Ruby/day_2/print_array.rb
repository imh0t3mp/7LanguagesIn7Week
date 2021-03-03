#!/usr/bin/ruby

# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each . Now, do the same with each_slice in
# Enumerable .

p 'Print numbers from 1 to 16:'
(1..16).each { |a| p a } # print all elements of array

p 'Print numbers from 1 to 16 per 4:'
(1..16).each_slice(4) { |a| p a } # output slices of array
