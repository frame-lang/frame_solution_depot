// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#id34

fn main {
    #StartStateInitDemo($(0),>(1))
}

#StartStateInitDemo [$[zero],>[one]]

    -machine-

    $StartState [zero]
        |>| [one]
            print(zero)  // use state param scope syntax
            print(one)      // resolves to state param scope
            ^
##
