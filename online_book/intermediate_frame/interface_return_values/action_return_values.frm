// https://docs.frame-lang.org/en/latest/intermediate_frame/return.html#actions-and-return-values

fn main {

    var sys:# = #InterfaceReturnFromAction()

    // 6. Print final interface return value.
    print(sys.getDecision())
}

#InterfaceReturnFromAction

    -interface-

    getDecision ^("yes")

    -machine-

    $No
        |getDecision|
            -> $Maybe ^("no")

    $Maybe
        |>|
            // 1. Set interface return with the return assignment operator.
            ^= "maybe another way"

            // 5. Print action return value.
            print(
                // 2. Call action.
                actionReturn()
            )
            ^

    -actions-

    actionReturn {
        // 3. Reset interface return again.
        ^= "action interface return"

        // 4. Do normal return from action.
        ^("action call return")
    }
##