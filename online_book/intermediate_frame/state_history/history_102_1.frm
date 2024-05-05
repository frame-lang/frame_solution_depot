// https://docs.frame-lang.org/en/latest/intermediate_frame/history.html#id4

fn main {
    var sys:# = #History102_1()
    sys.gotoB()
    sys.gotoD()
    sys.ret()
}

#History102_1

-interface-

gotoB
gotoC
gotoD
ret

-machine-

$A
    |gotoB| -> "B" $B ^
    |gotoC| -> "C" $C ^

$B
    // b is set to 0 when $B is initalized
    var b = 0

    |>|
        print("Entering $B. b = " + str(b)) ^

    |gotoD|
        // b set to 1 when leaving $B
        b = 1
        print("Going to $D. b = " + str(b))
        -> "D" $D("B") ^

$C
    // c is set to 0 when $B is initalized
    var c = 0

    |>|
        print("Entering $C. c = " + str(c)) ^

    |gotoD|
        // c set to 1 when leaving $C
        c = 1
        print("Going to $D. $C = " + str(c))
        -> "D" $D("C") ^

$D [previous_state]
    |ret|
        previous_state == "B" ? -> "return to $B" $B ^ :>
        previous_state == "C" ? -> "return to $C" $C ^ :| ^

##