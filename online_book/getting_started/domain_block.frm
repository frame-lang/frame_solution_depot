// https://docs.frame-lang.org/en/latest/getting_started/domain_block.html

fn main {
    var hws:# = #HelloWorldWithDomainSystem()
    hws.sayHello()
    hws.sayWorld()
}

#HelloWorldWithDomainSystem

    -interface-

    sayHello
    sayWorld

    -machine-

    $Hello
        |sayHello|
            actionWriteHello() // call action
            -> $World
            ^
    $World
        |sayWorld|
            actionWriteWorld() // call action
            -> $Done
            ^

    $Done

    -actions-

    actionWriteHello {
        actionWrite(hello_txt, " ") // use domain variable
    }

    actionWriteWorld {
        actionWrite(world_txt, "") // use domain variable
    }

    actionWrite [msg,separator] {
        print(msg, end=separator)
    }

    -domain-

    var hello_txt = "Hello"
    var world_txt = "World!"

##