// https://docs.frame-lang.org/en/latest/intermediate_frame/systems.html#start-state-enter-parameters

fn main {
    // System Start State Enter Arguments
    #StartStateEnterParameters(>(">StartStateEnterParameters started"))
}

// System Start State Enter Parameters
#StartStateEnterParameters [>[msg]]

    -machine-

    $Start
        // Start State Enter Parameters
        |>| [msg] print(msg) ^
##