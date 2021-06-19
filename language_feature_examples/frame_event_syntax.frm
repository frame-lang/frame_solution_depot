#FrameReturnSyntaxTest2Spec

    -interface-

    e1

    -machine-

    $S0

        @|e1|
            (f()) -> $S1(@ @|| @[x] @^) ^

        |e2|
            x() ? yes() ::
            (x()) ? yes() ::
            (@[x]) ? yes() :: ^

        |<|[a] ^

    $S1[event:FrameEvent msg:string param:object ret:object]
        |>|
            print_parts(event msg param ret)
            -> $S0 ^
##