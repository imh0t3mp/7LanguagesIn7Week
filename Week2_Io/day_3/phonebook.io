#!/usr/bin/env io

//Код превращает блоки вида
// {
//     "Bob Smith": "5195551212",
//     "Mary Walsh": "4162223434"
// }
// В ассоциативные массивы (хеши) кода Io

# START:range
OperatorTable addAssignOperator(":", "atPutNumber")
OperatorTable addAssignOperator("=>", "atPutNumber")
// OperatorTable println
# END:range
# START:curlyBrackets
// Метод curlyBrackets вызывается каждый раз, когда интерпритатор
// встречает фигурные скобки {} при попытке интерпритировать сообщение
curlyBrackets := method(
  "Parsing curly brackets" println
  r := Map clone
  call message arguments foreach(arg,
        ("Args:" .. arg) println
        r doMessage(arg)
        )
  r
)
# END:curlyBrackets
# START:atPutNumber
Map atPutNumber := method(
  self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1))
)
# END:atPutNumber
# START:use
s := File with("phonebook.txt") openForReading contents
// s println

phoneNumbers := doString(s)
phoneNumbers keys   println
phoneNumbers values println
# END:use
