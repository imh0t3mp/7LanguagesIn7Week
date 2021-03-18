#!/usr/bin/env io

// Write a program to add up all of the numbers in a two-dimensional
// array.

sumArray := method(x,
  sum := 0
  // Перебрать содержимое переданного на вход массива
  for (i, 0, x size - 1, 1,
    // посчитать сумму
    // proto - получить объект прототип для элеента
    // Если элемент это число, то взять его и добавить к сумме
    // Если элемент не число, то перебрать значения

		sum = sum + if (x at(i) proto == Number, x at(i), sumArray(x at(i)))
	)
	sum
)

arr := list(
	list(1,2,3),
	list(4,5,6),
	list(7,8,9)
)

arr at(0) println

x := sumArray(arr); x println
