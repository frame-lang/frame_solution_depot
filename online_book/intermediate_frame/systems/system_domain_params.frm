// https://docs.frame-lang.org/en/latest/intermediate_frame/systems.html#id15

fn main {
    // System Domain Arguments
    #SystemDomainParameters(#("#SystemDomainParameters started"))
}

// System Domain Parameters
#SystemDomainParameters [#[msg]]

    -machine-

    $Start
        |>| print(msg) ^

    -domain-

    // System Domain Argument initialization overridden
    var msg = nil

##