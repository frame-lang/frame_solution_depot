// https://docs.frame-lang.org/en/latest/intermediate_frame/systems.html#system-factory

fn main {
    #SystemInitializationDemo($("a","b"),>("c","d"),#("e","f"))
}

#SystemInitializationDemo [$[A,B], >[C,D], #[E,F]]

    -machine-

    $Start [A,B]
        |>| [C,D] print(A + B + C + D + E + F) ^


    -domain-

    var E = nil
    var F = nil
##