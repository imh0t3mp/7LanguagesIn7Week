# Ruby

Неделя 1 посвещена изучению языка **Ruby**

## Установка

Ну, вообще, установка языка не такая уж и сложная. А в случае с большинством **Linux** платформ, **Ruby**, в минимальном варианте конечно, предустановлен из коробки.

## Настройка окружения

А вот это уже поинтереснее будет.

### 1. установки

Добавил в settins.json файл блок кода к уже существующему:

```json"[ruby]": {
        "editor.formatOnSave": true,
        "editor.formatOnPaste": true,
        "editor.autoIndent": "advanced",
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

### 2. Плагины и прочее

Установил плагин [walkme.ruby-extension-pack](https://marketplace.visualstudio.com/items?itemName=walkme.Ruby-extension-pack)

> ext install walkme.Ruby-extension-pack

Дополнительно нужно доустановить:

#### **rubocop**

> sudo apt install rubocop

#### **solargraph** + **reek**

> gem install solargraph
> gem install reek

## День 1 - в поисках Няни

Автор книги, во вступлени к главе о Ruby упоминает Мэри Поппинс - чудесную няню, которая делала жизнь многх детей в Англии лучше и легче, не в последнюю очередь благодаря ложке сахара. И Ruby, для автора, сожержит много синтаксического сахара.

### О выводе и, возможно, о вводе данных

Вывести переменную в строку достаточно просто, но не так просто как, например, в PHP, где конкатернация переменных происходит через оператор точка .

```Ruby

variable = 'Мир!'

puts "Привет #{variable}"
```

#### (!) Замечание о строках

Строки с одинарной кавычкой интерпритируются как есть.
Строки в двойных кавычках вычисляемые, а это значит, что в такие строки допустимо вставлять значения переменных.

Для получения списка методов, которые доступны к объекту, достаточно вызвать соответсвующий метод

```Ruby
 4.methods
```

> [:-@, :**, :<=>, :upto, :<<, :<=, :>=, :==, :chr, :===, :>>, :[], :%, :&, :inspect, :+, :ord, :-, :/, :*, :size, :succ, :<, :>, :to_int, :coerce, :divmod, :to_s, :to_i, :fdiv, :modulo, :remainder, :abs, :magnitude, :integer?, :numerator, :denominator, :floor, :ceil, :round, :truncate, :lcm, :to_f, :^, :gcdlcm, :odd?, :even?, :allbits?, :anybits?, :nobits?, :downto, :times, :pred, :pow, :bit_length, :digits, :rationalize, :gcd, :to_r, :next, :div, :|, :~, :+@, :eql?, :singleton_method_added, :i, :real?, :zero?, :nonzero?, :finite?, :infinite?, :step, :positive?, :negative?, :rectangular, :arg, :real, :imaginary,...

Для получения класса объекта, нужно вызвать метод _.class_ для объекта

```Ruby
true.class
```

> TrueClass

(!) Ага, **true** и **false** это значения разных классов _**TrueClass**_ и _**FalseClass**_

#### unless

Интересный оператор _**unless**_, рабоает по правилу **"пока не"**. Впрочем, это самоочевидно из его названия

#### однострочники или блоки

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

(!)Что!?

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

### Заданиие

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

## День 2 - спустившись с небес (Floating Down from the Sky)

### Данные, массивы и прочее

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
stuff = {:array => [1, 2, 3], :string => 'Hi, mom!'}
```

Здесь символьное имя ключа начинается с символа двоеточия.

Хмм, где-то я это уже видел? Ааа, конечно, всё очень сильно похоже на **Perl**

### Блоки кода и yield

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
