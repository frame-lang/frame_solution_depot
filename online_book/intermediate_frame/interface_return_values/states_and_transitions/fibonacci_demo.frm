// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#id36

fn main {
    var fib:# = #FibonacciSystemParamsDemo($(0),>(1))
    loop var x = 0; x < 10; x = x + 1 {
        fib.next()
    }
}

#FibonacciSystemParamsDemo [$[zero],>[one]]

    -interface-

    next

    -machine-

    $Setup [zero]
        |>| [one]
            print(zero)
            print(one)

            // initialize $PrintNextFibonacciNumber state parameters

            -> $PrintNextFibonacciNumber(zero,one) ^

    // params [a,b] = (0,1)

    $PrintNextFibonacciNumber [a,b]
        |next|
            var sum = a + b
            print(sum)
            a = b
            b = sum
            ^
##