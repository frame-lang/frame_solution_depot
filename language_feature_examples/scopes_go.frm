
#ScopeIdentifiers

    -interface-

    Start @(|>>|)

    -machine-

    $Begin
        |>>| -> (2) $Scopes(4) ^

    $Scopes[d:int] --- 4

        var c:int = 3

        |>| [b:int] --- 2

            var a:int = 1

            output(a b c d e)
            output(||.a ||[b] $.c $[d] #.e) ^

    -actions-

    output[a:int b:int c:int d:int e:int]

    -domain-

    var e:int = 5
##
