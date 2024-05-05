// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id15

fn main {
    var sys:# = #ExitEventGoodbyeDemo()
    sys.next()

}

#ExitEventGoodbyeDemo

    -interface-

    next

    -machine-

    $Start
        |<| [msg,state]
            print(msg + " " + state + "!") ^

        |next|
            ("goodbye", "$Start") -> $End ^

    $End

##