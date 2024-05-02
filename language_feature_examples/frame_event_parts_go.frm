
#FrameEventParts

    -interface-

    Event_assignment 
    Event_parameter_assignment [p1:string]

    assign_event [x,y]

    -machine-

    $S0

        |assign_event| [x,y] 
            print_event(@) 
            ^
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



    -actions-

    print_event [@] {
        print(@||) 
        print(@[x])
        print(@[y])
    }

##
