// https://docs.frame-lang.org/en/latest/intermediate_frame/history.html#id7

fn main {
    var sys:# = #History104()
    print("--------------")
    sys.gotoB()
    sys.gotoD()
    sys.retToB()
    sys.gotoC()
    sys.gotoD()
    sys.retToC()
    print("--------------")
}

#History104

    -interface-

    gotoB
    retToB
    gotoC
    retToC
    gotoD

    -machine-

    $A
        |>| print("In $A") ^
        |gotoB| -> "B" $B ^

    $B
        var b = 0

        // upon reentry using a transition, b == 0
        |>| print("Entering $B. b = " + str(b)) ^

        |gotoC|
            print("--------------")
            print("Going to $C.")
            print("--------------")
            -> "C" $C ^
        |gotoD|
            b = 1
            print("Going to $D. b = " + str(b))
            -> "D" $D ^

    $C
        var c = 0

        // upon reentry using history pop, c == 1
        |>| print("Entering $C. c = " + str(c)) ^

        |gotoD|
            c = 1
            print("Going to $D. c = " + str(c))
            $$[+]  -> "D" $D ^

    $D
        |>| print("In $D") ^
        |retToB|
            print("Returning to $B")
            -> "retToB" $B ^
        |retToC|
            print("Returning to $C")
            -> "retToC" $$[-] ^

##