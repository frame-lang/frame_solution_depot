// https://docs.frame-lang.org/en/latest/intermediate_frame/hsm.html#id9

fn main {
    var sys:# = #ParentChildEnterExitDemo()
    sys.next()
    sys.next()
}

#ParentChildEnterExitDemo

    -interface-

    next

    -machine-

    // Dispatch operator (=>) defines state hierarchy

    $Child1 => $Parent
        |>|  print("enter handled in $Child1") :>
        |<|  print("exit handled in $Child1") :>

        |next| -> $Child2 ^


    $Child2 => $Parent
        |>|  print("enter handled in $Child2") :>
        |<|  print("exit handled in $Child2") :>

        |next| -> $Child1 ^

    $Parent
        |>| print("enter handled in $Parent") ^
        |<| print("exit handled in $Parent") ^
##