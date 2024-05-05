// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#id19

#StatesSystem

    -machine-

    $Begin
        |>| print("entering $Begin") ^
        |<| print("exiting $Begin") ^

    $Working

    $End
##