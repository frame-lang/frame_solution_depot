
fn main {
    var e:# = #Echo()

    print(e.echo("Echo test starting..."))
    print(e.echo("Can"))
    print(e.echo("you"))
    print(e.echo("hear"))
    print(e.echo("me"))
    print(e.echo("?"))
    print(e.echo(""))
    print(e.echo("Yes"))
}

#Echo 

    -interface-

    echo[msg] 

    -machine-

    $WhatSay 
        |echo| [msg]
            ^(msg)
##
