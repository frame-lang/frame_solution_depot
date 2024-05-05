// https://docs.frame-lang.org/en/latest/intermediate_frame/return.html#the-return-assign-operator

fn main {

    var sys:# = #InterfaceReturnMaybeAnotherWay()
    print(sys.getDecision())
}

#InterfaceReturnMaybeAnotherWay

    -interface-

    getDecision ^("yes")

    -machine-

    $No
        |getDecision|
            -> $Maybe ^("no")

    $Maybe
        |>|
            // Setting the interface return
            // using the "return assign" operator.

            ^= "maybe another way"
            ^

##