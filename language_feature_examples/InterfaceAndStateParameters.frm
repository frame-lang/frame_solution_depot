
#InterfaceAndStateParameters

    -interface-

    E1[x:string] @(|e1|)

    -machine-

    $S0

        @|e1|[x:string]
            print(x)
            -> $S1(x) ^

    $S1[msg:string]
        |>| print(&msg) ^

    -actions-

    print[msg:string]
##
