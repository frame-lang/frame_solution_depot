// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id13

fn main {
    var sys:# = #EnterEventParametersDemo2()
    sys.next()
}

#EnterEventParametersDemo2

    -interface-

    next

    -machine-

    $Start
        |next|
            -> ("$Start", "Hello")  $End("$End") ^

    $End [to]
         |>| [from, greeting]
            print(greeting + " " + to + ". Love, " + from) ^
##