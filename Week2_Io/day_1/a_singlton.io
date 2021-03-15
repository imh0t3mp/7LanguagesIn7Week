#!/usr/bin/env io

Highlinder := Object clone

Highlinder println

// Теперь сделаем Highlinder синглтоном

Highlinder clone := Highlinder

Highlinder println

fred := clone Highlinder
bob := clone Highlinder

fred == bob println

// А это не синглтон
a := Object clone
b := Object clone

a println
b println

a==b println
