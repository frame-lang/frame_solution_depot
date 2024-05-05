// https://docs.frame-lang.org/en/latest/intermediate_frame/return.html#id11

fn main {

    var sys:# = #InterfaceReturnMaybe()
    print(sys.getDecision())
}

#InterfaceReturnMaybe

    -interface-

    // 1. Default return value set to "yes".
    getDecision ^("yes")

    -machine-

    $No
        |getDecision|
            // 2. First override of return value to "no".
            // 3. Transition to $Maybe state.
            -> $Maybe ^("no")

    $Maybe
        |>|
            // 4. Upon entry set return value to "maybe".
            ^("maybe")

##