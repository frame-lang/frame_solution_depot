// https://docs.frame-lang.org/en/latest/getting_started/actions_block.html

fn main {
    var hws:# = #HelloWorldSystem()
    hws.sayHello()
    hws.sayWorld()
}

#HelloWorldSystem

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
        actionWrite("Hello", " ")
    }

    actionWriteWorld {
        actionWrite("World!", "")
    }

    actionWrite [msg,separator] {
        print(msg, end=separator)
    }
##