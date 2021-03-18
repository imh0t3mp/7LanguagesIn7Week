#!/usr/bin/env io


// How would you change / to return 0 if the denominator is zero?
// Заведм фейковый оператор
Number setSlot("/::", Number getSlot("/"))
// Ддобавим оператор
OperatorTable addOperator("/::", 1)
// Определим оператор
Number / := method(n, if(n == 0, "Деление на 0" println; 0, self /::(n)))

100 / 0 println
100 / 10 println

OperatorTable println
