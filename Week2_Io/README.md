# Io

Неделя 2 посвещена изучению языка **Io**

Согласно статье на [Wiki](https://ru.wikipedia.org/wiki/Io) **Io** - чисто объектно ориентированный язык.

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
