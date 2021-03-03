#!/usr/bin/ruby -w

# (!)Bonus problem: If you’re feeling the need for a little more, write
# a program that picks a random number. Let a player guess the
# number, telling the player whether the guess is too low or too high.

rnd = rand(10)

puts "I'm thinking about a number and this number between 1 and 10.
\nWhat number am I thinking?"

i_guess = gets.chomp
i_guess = i_guess.to_i

if i_guess < rnd then puts 'Naa, too low!'
elsif i_guess > rnd then puts 'Naa, too high'
else puts 'Yep, you\'re right!'
end
