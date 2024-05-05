// https://docs.frame-lang.org/en/latest/intermediate_frame/systems.html#start-state-parameters/

fn main {
    // System Start State Arguments
    #StartStateParameters($("$StartStateParameters started"))
}

// Start State Parameters Declared
#StartStateParameters [$[msg]]

    -machine-

    // Start State Parameters
    $Start [msg]
        |>| print(msg) ^
##