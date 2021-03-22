#!/usr/bin/env io

vizzini := Object clone
vizzini talk := method(
            "V: Fezzik, are there rocks ahead?" println
            yield
            "V: No more rhymes now, I mean it." println
            yield
            "V: Hello!" println
            yield
            "V: Does enybody here?" println
            yield
            "V: Em, hello!" println
            yield)

fezzik := Object clone
fezzik rhyme := method(
			yield
            "F: If there are, we'll all be dead." println
            yield
            "F: Anybody want a peanut?" println)

vizzini @@talk; fezzik @@rhyme

Coroutine currentCoroutine pause
