#!/usr/bin/env io

// Create a list syntax that uses brackets.

// Переопределим метод обраьботки квадратных скобок
squareBrackets := method(
	l := List clone
	call message arguments foreach(arg,
		content := self doMessage(arg);
		l push(content)
	)
	l
)

l := ["a", "list", "made", "with", "brackets"]
l println
l at(1) println
