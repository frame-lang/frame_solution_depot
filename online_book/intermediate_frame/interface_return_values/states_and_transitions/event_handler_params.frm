// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#event-handler-parameters

fn main {
    var ehpd:# = #EventHandlerParametersDemo()
    ehpd.init("Boris", 1959)
}

#EventHandlerParametersDemo

    -interface-

    init [name, birth_year]

    -machine-

    $Start

        |init| [name,birth_year]
            print("My name is " + name + " and I was born in " + str(birth_year))
            ^

##