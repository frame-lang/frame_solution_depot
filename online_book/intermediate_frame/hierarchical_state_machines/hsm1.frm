// https://docs.frame-lang.org/en/latest/intermediate_frame/hsm.html#id6

#HSM1

    -interface-

    a
    b

    -machine-

    $S0
        |b| -> "b" $S3 ^

    $S1 => $S0
        |a| -> "a" $S2 ^

    $S2 => $S0
        |a| -> "a" $S1 ^

    $S3
##