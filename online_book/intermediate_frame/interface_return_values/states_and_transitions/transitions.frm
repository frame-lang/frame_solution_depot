// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#transitions

fn main {
    var eemd:# = #EnterExitMessagesDemo()
    eemd.next()
    eemd.next()
}

#EnterExitMessagesDemo

    -interface-

    next

    -machine-

    $Begin
        |>| print("entering $Begin") ^
        |<| print("exiting $Begin") ^

        |next|
            -> $Working ^

    $Working
        |>| print("entering $Working") ^
        |<| print("exiting $Working") ^

        |next|
            -> $Working ^

    $End
        |>| print("entering $End") ^

##