// https://docs.frame-lang.org/en/latest/intermediate_frame/hsm.html#id5

#FlatStateMachine

    -interface-

    a
    b

    -machine-

    $S1
        |a| -> "a" $S2 ^
        |b| -> "b" $S3 ^

    $S2
        |a| -> "a" $S1 ^
        |b| -> "b" $S3 ^

    $S3

##

