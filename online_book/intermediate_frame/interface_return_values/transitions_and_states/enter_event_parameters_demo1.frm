// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id11

fn main {
    var sys:# = #EnterEventParametersDemo1()
    sys.next()
}

#EnterEventParametersDemo1

    -interface-

    next

    -machine-

    $Start
        |next|
            -> ("Hello")  $End ^

    $End
         |>| [msg] print(msg) ^
##