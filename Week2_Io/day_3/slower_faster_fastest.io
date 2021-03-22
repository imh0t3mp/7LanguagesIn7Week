#!/usr/bin/env io

slower := Object clone
faster := Object clone
fastest := Object clone

slower start := method(wait(2); writeln("Slower started"))
faster start := method(wait(1); writeln("Faster started"))
fastest start := method(writeln("Fastest started"))

// Стартуем процедуры паралллельно
slower @@start; faster @@start; fastest @@start; wait(1)
