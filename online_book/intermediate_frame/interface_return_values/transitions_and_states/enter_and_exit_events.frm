// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id8

fn main {
    var btmd:# = #BasicTransitionBehaviorDemo()
    btmd.next()
}

#BasicTransitionBehaviorDemo

    -interface-

    next

    -machine-

    $Start
        |<| print("exiting $Start state") ^
        |next|
            print("transitioning to $End state")
            -> $End ^

    $End
         |>| print("entering $End state") ^
##