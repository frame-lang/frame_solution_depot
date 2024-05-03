
#InterfaceAndStateParameters

    -interface-

    e1[x:string]

    -machine-

    $S0

        |e1|[x:string]
            print(x)
            -> $S1(x) ^

    $S1[msg:string]
        |>| print(msg) ^

##
