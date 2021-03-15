#!/usr/bin/env io

Vessel := Object clone

Vessel description := "Я просто некоторое судно"

Vessel println
Vessel slotNames

"\n==============================" println

TallyHo := Vessel clone
TallyHo println
TallyHo description println

TallyHo description := "Я Тэлли Хо, старый гафельный куттер."
"А теперь, после того как мне сказали кто Я" println
TallyHo description println
"\n==============================
\n==============================\n"println

// rowboat := Vessel clone
// rowboat println
// rowboat slotNames println
// // Хммм, очень странно. Слотов нет, но они доступны
// rowboat description println
// // Ааа, понял. Слотов в таких объектах нет, ведь они не типы. Интерпритатор идёт за значением в родительский тип
// rowboat description := "Может я шлюпка?"
// rowboat println
// rowboat slotNames println

// kanoe := rowboat clone
// kanoe println
// kanoe description println

// Создадим и определим метод bell для боъекта
TallyHo bell := method("Ding-dong!" println)
TallyHo bell
