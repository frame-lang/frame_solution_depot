// https://docs.frame-lang.org/en/latest/intermediate_frame/return.html#initialization-and-interface-return-values

fn main {

    var sys:# = #InterfaceReturnSurprise()
    print(sys.getDecision())
}

#InterfaceReturnSurprise

    -interface-

    // 3. getDecision is called after system initialization completed
    getDecision ^("yes - surprised?")

    -machine-

    $No
        // 1. Init call from system instantiation.
        // NOTE: this happens *before* getDecision is called!
        |>|
            -> $Maybe ^("no")

    $Maybe
        // 2. Still in the context of the system initialization
        |>|
            ^= "maybe another way"
            ^
##