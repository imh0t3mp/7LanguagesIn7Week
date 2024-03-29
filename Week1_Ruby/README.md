# Ruby

<!-- TOC -->

- [1. Установка](#1-установка)
- [2. Настройка окружения](#2-настройка-окружения)
  - [2.1. установки](#21-установки)
  - [2.2. Плагины и прочее](#22-плагины-и-прочее)
    - [2.2.1. **rubocop**](#221-rubocop)
    - [2.2.2. **solargraph** + **reek**](#222-solargraph--reek)
- [3. День 1 - в поисках Няни](#3-день-1---в-поисках-няни)
  - [3.1. О выводе и, возможно, о вводе данных](#31-о-выводе-и-возможно-о-вводе-данных)
    - [3.1.1. (!) Замечание о строках](#311--замечание-о-строках)
    - [3.1.2. unless](#312-unless)
    - [3.1.3. однострочники или блоки](#313-однострочники-или-блоки)
  - [3.2. Заданиие](#32-заданиие)
- [4. День 2 - спустившись с небес (Floating Down from the Sky)](#4-день-2---спустившись-с-небес-floating-down-from-the-sky)
- [5. Соглашения об именовании](#5-соглашения-об-именовании)
  - [5.1. Символы](#51-символы)
  - [5.2. Данные, массивы и прочее](#52-данные-массивы-и-прочее)
  - [5.3. Блоки кода и yield](#53-блоки-кода-и-yield)
  - [5.4. Классы](#54-классы)
  - [5.5. modules](#55-modules)
    - [5.5.1. include](#551-include)
    - [5.5.2. prepend](#552-prepend)
  - [5.6. Задание](#56-задание)
    - [5.6.1. Find](#561-find)
    - [5.6.2. Do](#562-do)
- [6. День 3 - серьезные переменными](#6-день-3---серьезные-переменными)
  - [6.1. Открытые для модификации классы](#61-открытые-для-модификации-классы)
  - [6.2. method_missing](#62-method_missing)
  - [6.3. Задание](#63-задание)
    - [6.3.1. Do](#631-do)

Неделя 1 посвещена изучению языка **Ruby**

## 1. Установка

Ну, вообще, установка языка не такая уж и сложная. А в случае с большинством **Linux** платформ, **Ruby**, в минимальном варианте конечно, предустановлен из коробки.

## 2. Настройка окружения

А вот это уже поинтереснее будет.

### 2.1. установки

Добавил в settins.json файл блок кода к уже существующему:

```json
"[ruby]": {
        "editor.formatOnSave": true,
        "editor.formatOnPaste": true,
        "editor.Indent": "advanced",
        "editor.tabSize": 2
    },
    // Ruby
    "ruby.lint": {
        "reek": true,
        "rubocop": true,
        "ruby": true,
        "fasterer": true,
        "debride": true,
        "ruby-lint": true
    },
    "ruby.intellisense": "rubyLocate",
    "ruby.codeCompletion": "rcodetools",
    "ruby.format": "rubocop",
    "ruby.useLanguageServer": true,
    "ruby.locate": {
        "exclude": "{**/@(test|spec|tmp|.*),**/@(test|spec|tmp|.*)/**,**/*_spec.rb}",
        "include": "**/*.rb"
    },
```

Код, по сути, является выдержкой и компиляцией из разных просмотренных на GitHub файлов.

### 2.2. Плагины и прочее

Установил плагин [walkme.ruby-extension-pack](https://marketplace.visualstudio.com/items?itemName=walkme.Ruby-extension-pack)

> ext install walkme.Ruby-extension-pack

Дополнительно нужно доустановить:

#### 2.2.1. **rubocop**

> sudo apt install rubocop

#### 2.2.2. **solargraph** + **reek**

> gem install solargraph
> gem install reek

## 3. День 1 - в поисках Няни

Автор книги, во вступлени к главе о Ruby упоминает Мэри Поппинс - чудесную няню, которая делала жизнь многх детей в Англии лучше и легче, не в последнюю очередь благодаря ложке сахара. И Ruby, для автора, сожержит много синтаксического сахара.

### 3.1. О выводе и, возможно, о вводе данных

Вывести переменную в строку достаточно просто, но не так просто как, например, в PHP, где конкатернация переменных происходит через оператор точка .

```Ruby

variable = 'Мир!'

puts "Привет #{variable}"
```

#### 3.1.1. (!) Замечание о строках

Строки с одинарной кавычкой интерпритируются как есть.
Строки в двойных кавычках вычисляемые, а это значит, что в такие строки допустимо вставлять значения переменных.

Для получения списка методов, которые доступны к объекту, достаточно вызвать соответсвующий метод

```Ruby
 4.methods
```

> [:-@, :\*_, :<=>, :upto, :<<, :<=, :>=, :==, :chr, :===, :>>, :[], :%, :&, :inspect, :+, :ord, :-, :/, :_, :size, :succ, :<, :>, :to_int, :coerce, :divmod, :to_s, :to_i, :fdiv, :modulo, :remainder, :abs, :magnitude, :integer?, :numerator, :denominator, :floor, :ceil, :round, :truncate, :lcm, :to_f, :^, :gcdlcm, :odd?, :even?, :allbits?, :anybits?, :nobits?, :downto, :times, :pred, :pow, :bit_length, :digits, :rationalize, :gcd, :to_r, :next, :div, :|, :~, :+@, :eql?, :singleton_method_added, :i, :real?, :zero?, :nonzero?, :finite?, :infinite?, :step, :positive?, :negative?, :rectangular, :arg, :real, :imaginary,...

Для получения класса объекта, нужно вызвать метод _.class_ для объекта

```Ruby
true.class
```

> TrueClass

(!) Ага, **true** и **false** это значения разных классов _**TrueClass**_ и _**FalseClass**_

#### 3.1.2. unless

Интересный оператор _**unless**_, рабоает по правилу **"пока не"**. Впрочем, это самоочевидно из его названия

#### 3.1.3. однострочники или блоки

Ruby позволяет писать как однострочники, так и блоки кода

Например

```Ruby
puts 'This appears to be true.' if x == 4
```

и

```Ruby
if x == 4
  puts 'This appears to be true.
end
```

работают одинаково. Но первая запись сильно экономит место.

**(!) Alarm !!!**

> Everything but nil and false evaluate to true. C and C++ programmers, take note. 0 is true !

> 0&&true
>
> true

**_(!)Что!?_**

**Ruby** считается языком сильно типизированным. Это означает, что выполнить, например, вот такой кода

```Ruby
1 + 'a'
```

не получится.
С другой стороны, проверка типов происходлит не на этапе выполнения а не на этапе компиляции.

**Ruby**, впрочем как и большинство скриптовых интерпритируемых языков использует принцип "Утиной типизации"

> Если это выглядит как утка, плавает как утка и крякает как утка, то это, вероятно, и есть утка.

И да, вот ещё что.

> С точки зрения Ruby - всё есть объект. Даже true или 4 - это объекты.

### 3.2. Заданиие

- Print the string “Hello, world.”
- For the string “Hello, Ruby,” find the index of the word “Ruby.”
- Print your name ten times.
- Print the string “This is sentence number 1,” where the number 1
  changes from 1 to 10.
- Run a Ruby program from a file.
- **(!)Bonus** problem: If you’re feeling the need for a little more, write
  a program that picks a random number. Let a player guess the
  number, telling the player whether the guess is too low or too high.

> (Hint: rand(10) will generate a random number from 0 to 9, and
> gets will read a string from the keyboard that you can translate to
> an integer.)

## 4. День 2 - спустившись с небес (Floating Down from the Sky)

## 5. Соглашения об именовании

> (!) Внимание
> Этот блок целиком скопирован из раздела [Wiki](https://ru.wikipedia.org/wiki/Ruby#%D0%A1%D0%B8%D0%BC%D0%B2%D0%BE%D0%BB%D1%8B)

Идентификаторы традиционно должны состоять из букв, цифр и знаков подчёркивания и начинаться с буквы или знака подчёркивания. Ruby использует соглашение об именовании:

- Имена, начинающиеся с прописной буквы, обозначают константы и классы.

- Имена, начинающиеся со строчной буквы или одиночного знака подчёркивания, обозначают локальные переменные и методы класса.

Также используются префиксы имён, определяющие область видимости идентификатора:

- Префикс **@** обозначает переменную экземпляра.
- Префикс **@@** обозначает переменную класса.
- Префикс **$** обозначает глобальную переменную или константу. Также он используется в именах предопределённых системных переменных.
- Префикс **:** обозначает символ (экземпляр класса Symbol).

Для имён методов применяются суффиксы, обозначающие назначение метода:

- Суффикс **!** обозначает деструктивный метод класса, то есть такой метод, вызов которого изменяет объект, для которого он вызван.
- Суффикс **?** обозначает предикат, то есть метод класса, возвращающий логическое значение.

### 5.1. Символы

Символ — это неизменяемая строка. Символьные литералы записываются с префиксом **:** (двоеточие).

```ruby
sym = :monday # :monday — это символ
puts sym      # ==> monday
puts :sunday  # ==> sunday
und = :"Unknown\tday of week" # Символ в кавычках может содержать пробелы и спецсимволы
# для символов работает получение срезов
puts und[8,6] # ==> day of
und[7] = ' '  # ОШИБКА! Символы неизменяемы.
```

### 5.2. Данные, массивы и прочее

Перед работой с массивом, его нужно создать.
Для создания массива нужно указать, что переменная это массива

```Ruby
a = []
a.class
```

Можно делать массив массивов.
А есть хеши (ассоциативные массивы - привет **PHP**).
Хеш отличается от массива тем, что в качестве имени поля может быть не только число но и строках

```Ruby
stuff = {:array => [1, 2, 3], :string => 'Hi, Mom!'}
```

Здесь символьное имя ключа начинается с символа двоеточия.

Хмм, где-то я это уже видел? Ааа, конечно, всё очень сильно похоже на **Perl**

### 5.3. Блоки кода и yield

Допустимо писать исполняемые блоки кода без объявления функции. Такие блоки кода можно передавать на вход других функций и методов.

Например:

```ruby
3.times {puts 'Превед, Медвед!'}
```

Выведет текст трижды в консоль

> Превед, Медвед!
> Превед, Медвед!
> Превед, Медвед!

Здесь код, который расположен между фигурными скобками - это блок кода.
Наиболее употребимо использовать блоки кода в однострочечниках.

В общем, всё это эквиваленты генераторов и итераторов в **Python**, работает аналогчно.

Для вызова блока кода из, например, функции, блок должен быть передан по ссылке(?)

```Ruby
def fall_the_block(&block)
  block.call
end
```

### 5.4. Классы

Всё - суть объект.
При создани классов следуют ряду соглашений:

1. Имя класса всегда начинается с заглавной буквы и вообще, в именах классов следуют CamelCase способу именования
2. Константы всегда должны быть записаны заглавными буквами CONST_NAME
3. Имена переменных и методов разделяют символом нижнего подчеркивания
4. Для отделения переменных экземпляра класса от локальных переменных, перед переменными экземпляра ставят @ а перед переменными класса @@

```ruby
class Person < Object       # класс Person наследуется от Object
   include Comparable        # подмешивание методов экземпляра из модуля Comparable

   @variable                 # переменная экземпляра
   @@count_obj = 0           # переменная класса для подсчёта числа созданных объектов
                             #
   def initialize(name, age) # конструктор (name, age - параметры метода)
     @name, @age = name, age # создаём объекты
     @@count_obj += 1        # увеличиваем счётчик на 1
   end

   def <=>(person\)
# переопределение оператора <=>
     @age <=> person.age     # из метода возвращается последнее вычисленное выражение
   end

   def to_s                  # для форматированного вывода информации puts
     "#{@name} (#{@age})"    # конструкция #{x} в 2-х кавычках замещается в строке текстовым значением x
   end

   def inspect               # метод используется интерпретатором для диагностического вывода
     "<#{@@count_obj}:#{to_s}>"
   end

   attr_reader :name, :age   # создание методов доступа на чтение для полей
 end

 # Создание массива экземпляров класса Person
 group = [ Person.new("John", 20),
          Person.new("Markus", 63),
          Person.new("Ash", 16) ]
 # для вывода автоматически вызывается метод inspect
 # => [<3:John (20)>, <3:Markus (63)>, <3:Ash (16)>]

 # сортировка и "переворачивание" массива стандартными методами
 # работает благодаря переопределению оператора <=>
 puts group.sort.reverse # Печатает:
                         # Markus (63)
                         # John (20)
                         # Ash (16)
 # метод between добавлен неявно при подключении Comparable
 group[0].between?(group[2], group[1]) # => true
```

Классы в **Ruby** поддерживают только единичное наследование. Множественное наследование возможно реализовать либо чечрез _модули_ либо через _примеси_

### 5.5. modules

_modules_ это коллекции переменных, констант и методов, которые можно переиспользовать, например, при создании своих собственных классов. _modules_ в **Ruby** это эквивалент _interface_ из **Java**

```Ruby
module ToFile
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(filename, 'w' ) {|f| f.write(to_s)}
  end
end

class Person
  include ToFile
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  def to_s
    name
  end
end


Person.new('matz' ).to_f
```

Два самых важных, пожалуй самых важных, модуля:

- _comparable_ - содержит методы, которые нужны при сравнении двух объектов класса. Модуль содержит оператор _**<=>**_, который возвращает
  - -1 если A < B
  - 1 если A > B
  - 0 если A == B
- _enumirate_ - содержит метод _each_

Вообще, в документации описано множество модулей. Среди полезных можно отметить также: _collect_ и _map_

Включать модули в классы можно двумя способами:

#### 5.5.1. include

```Ruby
module A
  def a1
    puts "a1 from module"
  end
end

class Test
  include A

  def a1
    puts "a1 from class"
  end
end

test = Test.new
test.a1
```

При подключении модуля с использованием _**include**_, будет производиться поиск методов **сначала** в классе а **потом** в модуле.

#### 5.5.2. prepend

```Ruby
module A
  def a1
    puts "a1 from module"
  end
end

class Test
  prepend A

  def a1
    puts "a1 from class"
  end
end

test = Test.new
test.a1
```

При подключении модуля с использованием _**prepend**_, будет производиться поиск методов **сначала** в модуле а **потом** в классе.

### 5.6. Задание

#### 5.6.1. Find

- Find out how to access files with and without code blocks. What
  is the benefit of the code block?
  ow would you translate a hash to an array? Can you translate
  arrays to hashes?
- Can you iterate through a hash?
- You can use Ruby arrays as stacks. What other common data
  structures do arrays support?

#### 5.6.2. Do

- Print the contents of an array of sixteen numbers, four numbers
  at a time, using just each . Now, do the same with each_slice in
  Enumerable .
- The Tree class was interesting, but it did not allow you to specify
  a new tree with a clean user interface. Let the initializer accept a
  nested structure with hashes and arrays. You should be able to
  specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child
  2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
- Write a simple grep that will print the lines of a file having any
  occurrences of a phrase anywhere in that line. You will need to do
  a simple regular expression match and read lines from a file. (This
  is surprisingly simple in Ruby.) If you want, include line numbers.

## 6. День 3 - серьезные переменными

(!) Хмм
Каждый язык программирования разработан с какой-то целью и хорош для решения определённых задач. По заявлению автора книги, **Ruby** хорош в задачах _**метапрограммирования**_

> _**Метапрограммирование**_ - это написание программ которые пишут программы.

### 6.1. Открытые для модификации классы

**Ruby** позволяет переопределить любой, абсолютно любой класс. Можно переопределить даже корневой класс самого языка.

Например вот так:

```Ruby
class Numeric
  def inches
    self
  end
  def feet
    self * 12.inches
  end
  def yards
    self * 3.feet
  end
  def miles
    self * 5280.feet
  end
  def back
    self * -1
  end
  def forward
    self
  end
end

puts 10.miles.back
puts 2.feet.forward
```

**(!) Но, со свободой приходит и ответственность.**

### 6.2. method_missing

Каждый раз, когда **Ruby** не находит вызываемый метод, происходит вызов специального отладочного метода _method_missing_
С одной стороны, это замедляет, может замедлять, работу программы. С другой, даёт в руки инструмент для гибкого реагрования на ситуацию.

Но, цена высока. При использовании магии метода _method_missing_ мы рассплачиваемся простотой отладки. При неосторожном использовании, можно погрязнуть в дебрях отладки и поиска ошибок.

### 6.3. Задание

#### 6.3.1. Do

Modify the CSV application to support an each method to return a
CsvRow object. Use method_missing on that CsvRow to return the value
for the column for a given heading.
For example, for the file:

> one, two
> lions, tigers

allow an API that works like this:

> csv = RubyCsv.new
> csv.each {|row| puts row.one}

This should print "lions".
