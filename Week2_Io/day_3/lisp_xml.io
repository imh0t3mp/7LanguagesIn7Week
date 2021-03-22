#!/usr/bin/env io


// Enhance the XML program to add spaces to show the indentation
// structure.

Builder := Object clone
// добавим к объекту свойство depth
Builder depth := 0
// Определим, что элемент должен отступать от края на depth*2 пробелов
Builder tab := method("  " repeated(depth))
// Метод forward
// Метод будет вызван в случае, если объект не содердит соответсвующего метода

Builder forward := method(
  writeln("<", call message name, ">")
  // Вошли в элемент? Увеличим глубину.
  depth = depth + 1
  // arguments println
  call message arguments foreach(
        arg,
        content := self doMessage(arg);
        // Вывести содержимое элемента со сдвигом
        if(content type == "Sequence", writeln(tab .. content)))
        writeln("</", call message name, ">")
  // Выходим - уменьшаем
  depth = depth - 1
)

Builder cul("Custom data")

Builder  ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"))
