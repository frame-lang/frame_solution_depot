// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#id15

fn main {
    var ehrd:# = #EventHandlerReturnDemo()
    var ret = ehrd.init("Boris", 1959)
    print("Succeeded = " + str(ret))
}

#EventHandlerReturnDemo

    -interface-

    // interface signature matches event handler signature

    init [name, birth_year] : bool

    -machine-

    $Start

        // event handler signature matches interface signature

        |init| [name, birth_year] : bool
            print("My name is " + name + " and I was born in " + str(birth_year))
            ^(true)

##