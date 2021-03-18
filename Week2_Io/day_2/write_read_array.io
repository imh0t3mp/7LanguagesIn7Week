#!/usr/bin/env io
// Write the matrix to a file, and read a matrix from a file.

// Сохранить файл
List save := method(path,
	str := ""
	self foreach(i, v, str := str .. i .. " ")

	f := File with(path)
	f remove
	f openForUpdating
	f write(str)
	f close
)

// Прочитать файл
List load := method(path,
	f := File with(path)
	f openForReading

	f readLine split
)

list(1,2,3,4) save("/tmp/array.tmp")
List load("/tmp/array.tmp") println
