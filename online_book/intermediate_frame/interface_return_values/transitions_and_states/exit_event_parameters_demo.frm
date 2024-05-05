// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id17

fn main {
    var sys:# = #ExitEventParametersDemo()
    sys.one()
    sys.two()
}

#ExitEventParametersDemo

    -interface-

    one
    two

    -machine-

    $Start
        |<| [event_msg]
            event_msg == "one" ? print(event_msg + " is a great number!") :>
            event_msg == "two" ? print(event_msg + " is a greater number!") :| ^

        |one| (@||) -> $Start ^
        |two| (@||) -> $Start ^

##