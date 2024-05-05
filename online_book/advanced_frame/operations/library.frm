// https://docs.frame-lang.org/en/latest/advanced_frame/operations.html#id4

fn main {

    var lib:# = #Library()
    print(lib.getGreeting("Bob"))
}

#Library

    -operations-

    #[static]
    getGreeting [name] : string {
        ^("Hello " + name + "!")
    }

##