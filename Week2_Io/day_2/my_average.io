#!/usr/bin/env io


// Add a slot called myAverage to a list that computes the average of
// all the numbers in a list. What happens if there are no numbers
// in a list? (Bonus: Raise an Io exception if any item in the list is not
// a number.)

l := list(1,1,2,2)

"Average: " print
l average println

// Реализуем свой метод для вычисления суммы.
// Если в списке будут не числа, метод выбросит исключение
mySumm := method( self reduce(first, item,
  if ( item isKindOf(Number) and first isKindOf(Number), first + item, Exception raise("Not numerical value"))
))
// А теперь реализуем свой метод вычисления среднего
List myAverage := method(if( self size == 0, Exception raise("Empty list"),mySumm(self) / self size ))
"My average: " print
l myAverage println
