#!/usr/bin/env io

// A Fibonacci sequence starts with two 1s. Each subsequent num-
// ber is the sum of the two numbers that came before: 1, 1, 2, 3,
// 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci
// number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem
// with recursion and with loops.

// Через рекурентный метод
fib := method(x,
  if ((0 == x) or (1 == x), x, fib(x-1) + fib(x-2))
)

x := fib(20); x println

// Через цикл
fib_loop := method(x,
  if ((0 == x) or (1 == x), x,
      ax := 0
      bx := 1
      val := ax + bx
      for(i, 2, x, 1,
            val = ax + bx
            ax = bx
            bx = val
          )
      val
  )
)

y := fib_loop(20); y println
