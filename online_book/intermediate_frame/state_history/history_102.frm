// https://docs.frame-lang.org/en/latest/intermediate_frame/history.html#id3

#History102

  -machine-

    $A
        |gotoB| -> "B" $B ^
        |gotoC| -> "C" $C ^

    $B
        |gotoD| -> "D" $D("B") ^

    $C
        |gotoD| -> "D" $D("C") ^

    $D [previous_state]
        |ret|
            previous_state == "B" ? -> "ret" $B ^ :>
            previous_state == "D" ? -> "ret" $C ^ :| ^

##