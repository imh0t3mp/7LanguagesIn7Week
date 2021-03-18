# Io

Неделя 2 посвещена изучению языка **Io**

Согласно статье на [Wiki](https://ru.wikipedia.org/wiki/Io) **Io** - чисто объектно ориентированный язык.
Ещё одна статья на [HabraHabr](https://habr.com/ru/post/28041/)
Основной источник сведений о языке это [Сайт](https://iolanguage.org/guide/guide.html#Syntax)

Следующий код печатает в консоли «Hello world!» посредством передачи строке сообщения println:

```Io
"Hello world!" println
```

Реализация шаблона проектирования «одиночка»:

```Io
Singleton := Object clone
//Объекты создаются (":=") клонированием существующих объектов
Singleton clone = Singleton
//Значение слота clone заменяется ("=") ссылкой на сам объект
```

## День 2 - Школа капитанов, тусовка

В **Io** всё - суть сообщение которое принимает входные данные.(Ммм, иначе говоря, можно писать цепочками!?)
Всё - суть объект которые можно клонировать(создавать) тогда, когда вам это нужно. Такие клоны называются _прототипы_

### Всё есть объект

В **Io** всё - суть объект.
Любой объект создаётся клонированием.

Создадим объект:

```code
~/io
Io> Vehicle := Object clone
==> Vehicle_0x1003b61f8:
type
= "Vehicle"
```

Зададим свойство(слот) объекта:

```code
Io> Vehicle description = "Something to take you far away"
==> Something to take you far away
Io> Vehicle nonexistingSlot = "This won't work."
Exception: Slot nonexistingSlot not found.
Must define slot using := operator before updating
---------
message 'updateSlot' in 'Command Line' on line 1
```

Просмотреть список доступных имён слотов:

```code
Io> Vehicle slotNames
==> list("type", "description")
```

### Объекты, прототипы и наследование

```code
Io> Car := Vehicle clone
==> Car_0x100473938:
type
= "Car"
Io>
==>
Io>
==>
Io> Car slotNames
list("type")
Io> Car type
Car
```

Всё отлично, создали объект _Car_

```code
Io> ferrari := Car clone
==> Car_0x1004f43d0:
Io> ferrari slotNames
==> list()
```

Что же случилось?
Всё очень просто. По соглашению, имена всех типов в Io должны начинаться с заглавной буквы.
При обращении к слоту объекта **Io** ищет слот в объекте, если слот не найдет, то идём искать в родительский тип и т.д, пока не найдём подходящий.
Типы в **Io** - это просто удоство, что-то, что сделано для облегчения жизни.
Таким образом, имена типов в **Io** - должны начинаться с прорписной буквы.
По результату высоконаучного метода тыка, получается следующее:

1 - да, типы начинаются с заглавной буквы
2 - если объект клонирован от типа, то у объекта можно получить значение слота который был опрелелён в типе
3 - но никто не запрещает клонировать объект не от типа, ведь всё - суть объект
4 - если был создан(клонирован) такой новый объект, то он не даст доступ к значению слота родительского объекта

> (!) Внимание
> Тип в **Io** это то, что имеет в своём составе слот _Type_

### Методы

Методы в **Io** создаются так же просто, как и объекты:

```code
Io> method("So, you've come for an argument." println)
==> method(
"So, you've come for an argument." println
)
```
Вуа-ля, метод готов!

Чтобы просмотреть содержимое слота объекта, нужно его вытащить через _**getSlot**_

```code
ObjectName.getSlot("SlotName")
```

Для того, чтобы получить сведения о прототипе объекта, нужно вызвать метод _**proto**_

```code
ObjectName proto
```

Есть зарезервированное имя пространства имён _**Lobby**_ которое содержит список всех объектов, которыми манипулирует скрипт

The prototype programming paradigm seems clear enough. These are
the basic ground rules:
Итак, парадигменный подход в **Io** определяет следующие базовые моменты:

* Всё есть объект
* Каждое обращение к объекту это сообщение
* Вы не создаёте классы, выц клонируете объекты
* ОБъекты помнят о своих прототипах
* Объекты имеют слоты
* Сообщение возвращает значение в слот или вызывает метод в слот
* Если объект можетответить сообщением, то он отправляет сообщение в его прототип

### Коллекции

В **Io** есть два типа коллекций:

1. _**List**_ - упорядоченный набор объектов любых типов. _**List**_ - прототип для всех сортированных списков
2. _**Map**_ - прототип для пар ключ=>значение

```Io
toDos := list("find my car", "find Continuum Transfunctioner")
```

List:

```code
Io> list(1, 2, 3, 4)
==> list(1, 2, 3, 4)
Io> list(1, 2, 3, 4) average
==> 2.5
Io> list(1, 2, 3, 4) sum
==> 10
Io> list(1, 2, 3) at(1)
==> 2
Io> list(1, 2, 3) append(4)
==> list(1, 2, 3, 4)
Io> list(1, 2, 3) pop
==> 3
Io> list(1, 2, 3) prepend(0)
==> list(0, 1, 2, 3)
Io> list() isEmpty
==> true
```

Map:

```code
o> elvis := Map clone
==> Map_0x115f580:
Io> elvis atPut("home", "Graceland")
==> Map_0x115f580:
Io> elvis at("home")
==> Graceland
Io> elvis atPut("style", "rock and roll")
==> Map_0x115f580:
Io> elvis asObject
==> Object_0x11c1d90:
home
= "Graceland"
style
= "rock and roll"
Io> elvis asList
==> list(list("style", "rock and roll"), list("home", "Graceland"))
Io> elvis keys
==> list("style", "home")
Io> elvis size
==> 2
```

_**List**_ и _**Map**_ можно комбинровать с сложносоставные объекты

### true, false, nil, and singletons

```code
4 < 5
true
4 <= 3
false
true and false
false
true and true
true
true or true
true
true or false
true
4 < 5 and 6 > 7
false
true and 6
true
true and 0
true
```

> (!) Внимание
> В **Io** также как и **Ruby** 0 это true

А теперь интересное:

```code
rue clone
true
false clone
false
nil clone
nil
```

Клонирование чисел, булевых значений и nil интерпритатор вернёт сам обьект. Т.е. true, false и nil - это синглтоны.

Хак! Как создать синглтон

```code
Io> Highlander := Object clone
==> Highlander_0x378920:
type
= "Highlander"
Io> Highlander clone := Highlander
==> Highlander_0x378920:
clone
= Highlander_0x378920
type
= "Highlander"
```

#### Вы хотите выстрелить себе в ногу? Тогда мы идём к вам!

Io можно любить или ненавидеть, но этот язык достоин существовать. Но, в этом языке очень, до езобразия просто выстрелить себе не в ногу, нет, выстрелить прямо в голову

```Io
Object clone := "брика бряк"
```

и вуаля!!!

### домашнее задание

Day 1 Self-Study

> When you’re looking for Io background, searching for answers is going
to be a little tougher because Io has so many different meanings. I
recommend Googling for Io language.
>> Find:
>> * Some Io example problems
>> * An Io community that will answer questions
>> * A style guide with Io idioms

Answer:

> * Evaluate 1 + 1 and then 1 + "one" . Is Io strongly typed or weakly
typed? Support your answer with code.

> * Is 0 true or false? What about the empty string? Is nil true or false?
Support your answer with code.
> * How can you tell what slots a prototype supports?
> * What is the difference between = (equals), := (colon equals), and ::=
(colon colon equals)? When would you use each one?

>> ::= - создать слот,создать сеттер,присвоить значение

>> := - создать слот, присвоить значение

>> = - присвоить значение


Do:

>> * Run an Io program from a file.
>> * Execute the code in a slot given its name.
>Spend a little time playing with slots and prototypes. Make sure you
understand how prototypes work.


## ChatOps

Провёл интеграцию GitHub+Trello+Slack. Нужно проверить, как оно будет работать

## День 2 - колбасный король

### Циклы и управление выполнением

#### loop, while и for

Циклы и опрераторы управления в **Io** с одной стороны очень простые, с другой не всегда их просто понять. Например, вот как можно сделать бесконечный Циклы

```Io
loop("кап" println)
```

Он будет выполняться до тех пор, пока мы его не остановим вручную.
Оператор **_while_** имеет несколько инуую структуру.
Например, вот код для вывода в консоль значения переменной i, которая увеличивает своё значение на каждой итерации:

```Io
i := 1
while(i <= 11, i println; i = i + 1);
```

Для **_for_** синтаксис несколько иной.

```Io
for (i, 1, 10, i println);
```

Здесь:

i - переменная
1 - начальное значение i
10 - конечное значение i

Допустимо использовать опциональный параметр инкремента значения.
Например, вывести все числа от 1 до 10 с шагом 3:

```Io
for(i, 1, 10, 3, i priuntln);
```

В циклах можно использовать и не обязательные аргументы.

Например:

```Io
for(i,1,5,i println,"Ola!");
```

цикл отработает, значение пременной _i_ изменится, но действие _i println_ не будет выполнено. Вместо него, **_for_** будет пытаться выполнить строку как действие и, на минуточку, ничего не скажет о возможности выполнить такое действие (!!!)

```Io
for(i,1,5,3,i println,"Alloha!");
```

цикл исполнится, пременная _i_ изменит своё значение с шагом 3 и дополнительный аргумент нкак не повлияет на логику.

Иногда **Io** может сбивать с толку, особенно когда используется что-то похожее в дебрях библиотеки. Но, увы, никто не обещал что будет просто. Неразумное использование свободы действий может привнести боль в жизнь.

#### if

_**If**_ в  **Io** имеет более чётку структуру

> if(condition, true code, false code)

Но, вот ведь странно, даже этот оператор можно записать в разной форме:

```code
Io> if(true, "It is true.", "It is false.")
==> It is true.
Report erratum
Prepared exclusively for Montelymard
this copy is (P1.0 printing, October 2010)
76D AY 2: T HE S AUSAGE K ING
Io> if(false) then("It is true") else("It is false")
==> nil
Io> if(false) then("It is true." println) else("It is false." println)
It is false.
==> nil
```

### опрераторы

Как и в любом языке программирования **Io** имеет множество разных операторов.
Но, язык позволяет также и добавлять свои.

**_OperatorTable_** - выведет таблицу со списком операторов
**_adOperator_** - добавить оператор
_**addAssignOperator**_ - добаить оператор сравнения


Например, добавим оператор деления с проверкой делителя на 0

```Io
Number setSlot("/::", Number getSlot("/"))
OperatorTable addOperator("/::", 1)
Number / := method(n, if(n == 0, "devide by 0" println; 0, self /::(n)))

100 / 0
100 / 10
```

### сообщения

В **Io** _ВСЁ_, ну разве что кроме коментариев и точки - сообщения. Одна из главных особенностей языка - это рефлекия сообщений

Любое сообщение имеет три компонена:

- отправитель (sender)
- цель (target)
- аргументы (arguments)

Метод **_call_** даёт дополнительную информацию о ***любом*** сообщении.

```Io
//Добавим объект postOffice
postOffice := Object clone
//и добавим к нему метод
postOffice packageSender := method(call sender)

//Добавим объект mailer
mailer := Object clone
//И пусть он теперь может доставлять отправления через почтовое отделение
mailer deliver := method(postOffice packageSender)

//Ну а теперь, пусть отправитель отправитт сообщение

mailer deliver

postOffice messageTarget := method(call target)
```
