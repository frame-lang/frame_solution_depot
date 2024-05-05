// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#id17

fn main {
    var sys:# = #ContinueTerminatorDemo()
    sys.passMe1()
    sys.passMe2()
}

#ContinueTerminatorDemo

    -interface-

    passMe1
    passMe2

    -machine-

    // Dispatch operator (=>) defines the state hierarchy

    $Child => $Parent

        // Continue operator sends events to $Parent

        |passMe1|  :>
        |passMe2|  print("handled in $Child") :>

    $Parent

        |passMe1| print("handled in $Parent") ^
        |passMe2| print("handled in $Parent") ^

##