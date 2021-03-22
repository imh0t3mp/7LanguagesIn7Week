#!/usr/bin/env io

Builder := Object clone

// Метод forward
// Метод будет вызван в случае, если объект не содердит соответсвующего метода

Builder forward := method(
  writeln("<", call message name, ">")
  // arguments println
  call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if(content type == "Sequence", writeln(content)))
        writeln("</", call message name, ">")
)

Builder cul("Custom data")

Builder  ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"))

// Builder println
