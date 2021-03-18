#!/usr/bin/env io

// Сообщение, если угадал
trueMessage := "Угадал!!!"

// Сравнить значения
diffMessage := method(answer, input,
	if(answer > input, "Нет, больше.", "Нет, меньше.")
)

// Вывести сообщение, если значение не правильное
falseMessage := method(remainChance, answer, input,
	 diffMessage(answer, input) .. " Осталось " .. remainChance .. " попыток"
)
// Вывести собощение, если не угадал
failMessage := method(answer,
	"Все попытки исчерпаны. Правильный ответ: " .. answer
)

// Метод проверки
check := method(remainChance, answer,
// Если есть ещё попытки
	(remainChance <= 0) ifTrue(failMessage(answer) println; return)
// Прочитать ответ из stdin
	"Ваш вариант : " print
	in := File standardInput readLine asNumber

	if (in == answer, trueMessage println, falseMessage(remainChance - 1, answer, in) println; check(remainChance - 1, answer))
)

randomValue := Random value(100 + 1) floor

"Я загадал число. Попробуй его угадать с 10 попыток" println
check(10, randomValue)
