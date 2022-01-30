
#FrameEventParts

    -interface-

    Event_assignment @(|event_assignment|)
    Event_parameter_assignment [p1:string]
    Return_assignment:string @(|return_assignment|)
    Return_expression:string @(|return_expression|)

    -machine-

    $S0

        |event_assignment|
            var frameEvent:`*framelang.FrameEvent` = @
            frameEventParm(frameEvent)
            frameEventParm(@)
            ^

        |Event_parameter_assignment|[p1:string]
            var x:string = @[p1]
            var y:string = p1
            print(x)
            print(y)
            print(@[p1])
            @[p1] = "hi"
            print(@[p1])
            ^

        |event_msg_assignment|
            var msg:string = @||
            print(msg)
            ^

        |return_assignment|:string
            @^ = @||
            print(@^)
            ^

        |return_expression|:string
            @^ = "3"
            var x:string = @^
            print(@^)
            ^(@||)

    -actions-

    frameEventParm[evt:`*framelang.FrameEvent`]
    print[msg:string]
    print_bool[b:bool]
##
