#!/usr/bin/env io

"loop 1" println
for(i,1,5,i println);

i := 1
"loop 2 - with steps 2" println
for(i,1,5,3,i println);

i := 1
"loop 3 - without steps but with additional argument" println
for(i,1,5,i println,"Ola!"); "Heya! I've puked in your Car! This loop didn't print anything as was expected." println

"But... now i:" print
i println


i := 1
"loop 4 - with steps and with additional argument" println
for(i,1,5,3,i println,"Alloha!");
