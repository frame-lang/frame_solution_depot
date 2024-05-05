// https://docs.frame-lang.org/en/latest/intermediate_frame/history.html#history-101

#History101

  -machine-

    $A
        |gotoB| -> "B" $B ^
        |gotoC| -> "C" $C ^

    $B
        |gotoD| -> "D" $D ^

    $C
        |gotoD| -> "D" $D ^

    $D

##