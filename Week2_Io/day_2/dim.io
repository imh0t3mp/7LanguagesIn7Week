#!/usr/bin/env io

// Write a prototype for a two-dimensional list.
// The dim(x, y) method should allocate a list of y lists
// that are x elements long. set(x, y, value)
// should set a value, and get(x, y) should return that value.
// Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
// matrix get(x, y) on the original list.

// Создать объект
MyProto := List clone
// Доавить метод dim - для создания  массива
MyProto dim := method(x, y,
	self setSize(x)
	for(i, 0, x - 1, 1, self atPut(i, list() setSize(y)))
)
//  метод для определения элемента массива
MyProto set := method(x, y, value, self at(x) atPut(y, value))
// Метод для получения элемента массива
// Метод для получения элемента массива
MyProto get := method(x, y, self at(x) at(y))
// Метод для транспонирования массива
MyProto transpose := method(
	new := MyProto dim(self at(0) size, self size)
	for (i, 0, self size - 1, 1,
		for (j, 0, self at(0) size - 1, 1,
			new set(j, i, self get(i, j))
		)
	)
	new
)

a := MyProto clone
a dim(3, 3)
a set(0, 0, "a")
a set(0, 1, "01")
a set(0, 2, "02")
a set(1, 0, "10")
a set(1, 1, "b")
a set(1, 2, "12")
a set(2, 0, "20")
a set(2, 1, "21")
a set(2, 2, "c")
a get(2, 2) println

a println

a transpose println
