# Io

<!-- TOC -->

- [1. День 1](#1-день-1)
- [2. День 2 - Школа капитанов, тусовка](#2-день-2---школа-капитанов-тусовка)
  - [2.1. Всё есть объект](#21-всё-есть-объект)
  - [2.2. Объекты, прототипы и наследование](#22-объекты-прототипы-и-наследование)
  - [2.3. Методы](#23-методы)
  - [2.4. Коллекции](#24-коллекции)
  - [2.5. true, false, nil, and singletons](#25-true-false-nil-and-singletons)
    - [2.5.1. Вы хотите выстрелить себе в ногу? Тогда мы идём к вам!](#251-вы-хотите-выстрелить-себе-в-ногу-тогда-мы-идём-к-вам)
  - [2.6. домашнее задание](#26-домашнее-задание)
- [3. (!) ChatOps](#3--chatops)
- [4. День 2 - колбасный король](#4-день-2---колбасный-король)
  - [4.1. Циклы и управление выполнением](#41-циклы-и-управление-выполнением)
    - [4.1.1. loop, while и for](#411-loop-while-и-for)
    - [4.1.2. if](#412-if)
  - [4.2. опрераторы](#42-опрераторы)
  - [4.3. сообщения](#43-сообщения)
  - [4.4. рефлексия](#44-рефлексия)
  - [4.5. ДЗ](#45-дз)
- [5. День 3 - Парад и другие странные места](#5-день-3---парад-и-другие-странные-места)
  - [5.1. параллельное исполнение - coroutines](#51-параллельное-исполнение---coroutines)
  - [5.2. акторы (actors)](#52-акторы-actors)
  - [5.3. Фичи (features)](#53-фичи-features)
  - [5.4. ДЗ](#54-дз)

Неделя 2 посвещена изучению языка **Io**

## 1. День 1

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

## 2. День 2 - Школа капитанов, тусовка

В **Io** всё - суть сообщение которое принимает входные данные.(Ммм, иначе говоря, можно писать цепочками!?)
Всё - суть объект которые можно клонировать(создавать) тогда, когда вам это нужно. Такие клоны называются _прототипы_

### 2.1. Всё есть объект

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

### 2.2. Объекты, прототипы и наследование

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

### 2.3. Методы

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

- Всё есть объект
- Каждое обращение к объекту это сообщение
- Вы не создаёте классы, выц клонируете объекты
- ОБъекты помнят о своих прототипах
- Объекты имеют слоты
- Сообщение возвращает значение в слот или вызывает метод в слот
- Если объект можетответить сообщением, то он отправляет сообщение в его прототип

### 2.4. Коллекции

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

### 2.5. true, false, nil, and singletons

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

#### 2.5.1. Вы хотите выстрелить себе в ногу? Тогда мы идём к вам!

Io можно любить или ненавидеть, но этот язык достоин существовать. Но, в этом языке очень, до езобразия просто выстрелить себе не в ногу, нет, выстрелить прямо в голову

```Io
Object clone := "брика бряк"
```

и вуаля!!!

### 2.6. домашнее задание

Day 1 Self-Study

> When you’re looking for Io background, searching for answers is going
> to be a little tougher because Io has so many different meanings. I
> recommend Googling for Io language.
>
> > Find:
> >
> > - Some Io example problems
> > - An Io community that will answer questions
> > - A style guide with Io idioms

Answer:

> - Evaluate 1 + 1 and then 1 + "one" . Is Io strongly typed or weakly
>   typed? Support your answer with code.

> - Is 0 true or false? What about the empty string? Is nil true or false?
>   Support your answer with code.
> - How can you tell what slots a prototype supports?
> - What is the difference between = (equals), := (colon equals), and ::=
>   (colon colon equals)? When would you use each one?

> > ::= - создать слот,создать сеттер,присвоить значение

> > := - создать слот, присвоить значение

> > = - присвоить значение

Do:

> > - Run an Io program from a file.
> > - Execute the code in a slot given its name.
> >   Spend a little time playing with slots and prototypes. Make sure you
> >   understand how prototypes work.

## 3. (!) ChatOps

Провёл интеграцию GitHub+Trello+Slack. Нужно проверить, как оно будет работать

## 4. День 2 - колбасный король

### 4.1. Циклы и управление выполнением

#### 4.1.1. loop, while и for

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

#### 4.1.2. if

_**If**_ в **Io** имеет более чётку структуру

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

### 4.2. опрераторы

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

### 4.3. сообщения

В **Io** _ВСЁ_, ну разве что кроме коментариев и точки - сообщения. Одна из главных особенностей языка - это рефлекия сообщений

Любое сообщение имеет три компонена:

- отправитель (sender)
- цель (target)
- аргументы (arguments)

Метод **_call_** даёт дополнительную информацию о **_любом_** сообщении.

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

Другой пример, определим метод _unless_

```Io
unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)
```

А теперь, пытаемся выполнить следующий код:

```Io
princessButtercup unless(trueLove,("It is false" println), ("It is true" println))
```

работает это так:

1 - взять значение **_trueLove_**
2 - если **_trueLove_** (нулевой аргумент) имеет значение _true_
2.1 - тогда выполнить действие предписанное во втором аргументе
2.2 - если _false_, выполнить действие предписанное в 1м аргументе

### 4.4. рефлексия

**Io** предлагает набор методов, позволяющих понять, что происходит в
слотах. Например вот такой код:

```Io
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
```

### 4.5. ДЗ

1. A Fibonacci sequence starts with two 1s. Each subsequent num-
   ber is the sum of the two numbers that came before: 1, 1, 2, 3,
   5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci
   number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem
   with recursion and with loops.
2. How would you change / to return 0 if the denominator is zero?
3. Write a program to add up all of the numbers in a two-dimensional
   array.
4. Add a slot called myAverage to a list that computes the average of
   all the numbers in a list. What happens if there are no numbers
   in a list? (Bonus: Raise an Io exception if any item in the list is not
   a number.)
5. Write a prototype for a two-dimensional list. The dim(x, y) method
   should allocate a list of y lists that are x elements long. set(x, y,
   value) should set a value, and get(x, y) should return that value.
6. Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
   matrix get(x, y) on the original list.
7. Write the matrix to a file, and read a matrix from a file.
8. Write a program that gives you ten tries to guess a random number
   from 1–100. If you would like, give a hint of “hotter” or “colder”
   after the first guess.

## 5. День 3 - Парад и другие странные места

### 5.1. параллельное исполнение - coroutines

При параллельном исполнении, любое сообщение может быть вызвано синхронно.
Для этого нужно использовать метки @ или @@

@ - вернёт результат позже
@@ - вернёт nil и запустит интерпритацию собщения в своём отдельном потоке

### 5.2. акторы (actors)

```Io
slower := Object clone
faster := Object clone
fastest := Object clone

slower start := method(wait(2); writeln("Slower started"))
faster start := method(wait(1); writeln("Faster started"))
fastest start := method(writeln("Fastest started"))

// Стартуем процедуры паралллельно
slower @@start; faster @@start; fastest @@start; wait(1)
```

Работает этот код вот как.
1 - запускам параллельно три метода _start_ каждого из объектов.

@@ говорит, что нужно стартовать и немедленно вернуть управление основному потоку.

Но, есть особенность, которая мне пока не понятна. Точнее, не понятно как ее обойти.
Если из цепочки исполнения убрать финальный wait, то исполнение скрипта закончится до того, как отработают все акторы. И это странно.

### 5.3. Фичи (features)

Фича - это результирующий объект, который вернул асинхронный месседж(сообщение) сразу же после старта.
Если к фиче обратиться до того, как результат будет определён, интерпритатор будет ждать завершения исполнения потока.

### 5.4. ДЗ

- Enhance the XML program to add spaces to show the indentation
  structure.
- Create a list syntax that uses brackets.
- Enhance the XML program to handle attributes:

  - if the first argument is a map (use the curly brackets syntax), add attributes to
    the XML program.
    For example:

  ```Io
  book({"author": "Tate"}...) would print <book author="Tate"> :
  ```
