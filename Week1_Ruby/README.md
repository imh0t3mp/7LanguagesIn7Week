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

#### **solargraph**

> gem install solargraph

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

Что!?

Ruby считается языком сильно типизированным. Это означает, что выполнить, например, вот такой кода

```Ruby
1 + 'a'
```

не получится.
С другой стороны, проверка типов происходлит не на этапе выполнения а не на этапе компиляции.

**Ruby**, впрочем как и большинство скриптовых интерпритируемых языков использует принцип "Утиной типизации"

> Если это выглядит как утка, плавает как утка и крякает как утка, то это, вероятно, и есть утка.

И да, вот ещё что.

> С точки зрения Ruby - всё есть объект. Даже true или 4 - это объекты.
