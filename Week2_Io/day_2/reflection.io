#!/usr/bin/env io
// Создадим метод, который через рефлексию будет изымать список слотов объекта
Object ancestors := method(
	prototype := self proto  // объект, от которого вызвали метод
	if(prototype != Object, // если объект имеет тип Object
        writeln("Slots of ", prototype type, "\n---------------")
        prototype slotNames foreach(slotName, writeln(slotName))
        writeln
        prototype ancestors)) //Тогда высти список его слотов

// Теперь создадим объект Animal и определим его метод
Animal := Object clone
Animal speak := method(
            "ambiguous animal noise" println)

// Duck - наследует свойства (слоты) от объекта Animal
Duck := Animal clone
Duck speak := method(
            "quack" println)
// Duck расширяет методы Animal дополнительным методом
Duck walk := method(
            "waddle" println)

// Теперь создадим экземпляр duck объекта Duck
disco := Duck clone
// А теперь, пройдёмся по объекту duck и извлечем всю информацию объ объекте и
// его предках
disco ancestors


i := true

i ancestors
