#!/usr/bin/env io


// Enhance the XML program to add spaces to show the indentation
// structure.
// Enhance the XML program to handle attributes:
  // - if the first argument is a map (use the curly brackets syntax), add attributes to
//   the XML program.
//   For example:

// ```Io
// book({"author": "Tate"}...) would print <book author="Tate"> :
// ```

OperatorTable addAssignOperator(":", "atPutAttr")
OperatorTable addAssignOperator("=>", "atPutAttr")

// Т.к. атрбуты передаём в фигурных скобках,
// то определим метод обработки таких данных
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
        r doMessage(arg) ;
        )
  r

)
// Теперь, определим метод парсинга значений
Map atPutAttr := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1))
)

Builder := Object clone
// добавим к объекту свойство depth
Builder depth := 0
// Определим, что элемент должен отступать от края на depth*2 пробелов
Builder tab := method("  " repeated(depth))
// Метод forward
// Метод будет вызван в случае, если объект не содердит соответсвующего метода

Builder forward := method(
  arguments := call message arguments
	write(" " repeated(indent), "<", call message name)
	if(arguments at(0) type == "Map",
		arguments at(0) foreach(attr, value,
			write(" \"", attr, "\"=\"", value, "\""))
		arguments removeFirst)
	writeln(">")
	self indent = indent + 1
	call message arguments foreach(
		arg,
		content := self doMessage(arg);
		if(content type == "Sequence",
			writeln(" " repeated(indent), content)))
	self indent = indent - 1
	writeln(" " repeated(indent), "</", call message name, ">"))

// Builder book({"autor"=>"Leo Tolstoy"},"War and Peace")
