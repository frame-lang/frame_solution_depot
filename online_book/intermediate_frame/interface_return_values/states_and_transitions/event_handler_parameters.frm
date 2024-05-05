// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#id4

fn main {
    var ehpd:# = #EventHandlerParametersDemo()
    var ret = ehpd.init("Boris", 1959)
    print("Succeeded = " + str(ret))
}

#EventHandlerParametersDemo

    -interface-

    init [name, birth_year] : bool // init method

    -machine-

    $Start

        |init| [name,birth_year] : bool
            print("My name is " + name + " and I was born in " + str(birth_year))
            ^(true)

##