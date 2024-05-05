// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#event-handler-variables

fn main {
    #EventHandlerVariablesDemo()
}

#EventHandlerVariablesDemo

    -machine-

    $Begin
        |>|
            var x = 21 * 2
            print("Meaning of life = " + str(x))
        ^
##