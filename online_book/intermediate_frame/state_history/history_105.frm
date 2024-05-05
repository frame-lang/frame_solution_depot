// https://docs.frame-lang.org/en/latest/intermediate_frame/history.html#id9

fn main {
    var sys:# = #History105()
    // Currently in $A
    sys.gotoC()
    // Now in $C
    sys.ret()
    // Now back in $A
    sys.gotoB()
    // Now in $B
    sys.gotoC()
    // Now in $C
    sys.ret()
    // Now back in $B
}

#History105

    -interface-

    gotoB
    gotoC
    ret

    -machine-

    $A
        var a = 0

        |>| print("In $A. a = " + str(a)) ^

        |gotoB|
            print("Transitioning to $B")
            -> $B ^

        |gotoC|
            // When we return, a == 1
            a = a + 1
            print("Incrementing a to " + str(a))
            $$[+] -> $C ^

    $B
        var b = 0

        |>| print("In $B. b = " + str(b)) ^

        |gotoC|
            // When we return, b == 1
            b = b + 1
            print("Incrementing b to " + str(b))
            $$[+] -> $C ^

    $C
        |>| print("In $C") ^

        |ret|
            print("Return to previous state")
            -> $$[-] ^
##