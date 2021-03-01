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
