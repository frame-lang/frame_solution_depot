#FrameReturnSyntaxTestSpec

    -interface-

    ReturnAssignment:int @(|returnAssignment|)
    ReturnExpression:int @(|returnExpression|)
    EventPartsAssignment[x:string]:string @(|eventPartsAssignment|)
    EventPartsExpression[x:string]:string @(|eventPartsExpression|)

    -machine-

    $S0
        |returnAssignment| @^ = (42) ^
        |returnExpression| ^(42)
        |eventPartsAssignment|[x:string]:string
            @^ = "" --- needed as the cast to string otherwise panics
            @^ = format_event_parts(@ @|| @[x]  @^) ^
        |eventPartsExpression|[x:string]:string
            @^ = "" --- needed as the cast to string otherwise panics
            ^(format_event_parts(@ @|| @[x] @^))


    -actions-

    format_event_parts [e:`*framelang.FrameEvent`
                        msg:string
                        param:`string`
                        ret:`string`]:string
##
