// https://docs.frame-lang.org/en/latest/getting_started/index.html#events

#Lamp

    -machine-

    $Off                    // $Off state
        |turnOn|            // event selector for 'turnOn' event message
            -> $On          // transition to $On state
            ^               // return from event handler

    $On                     // $On state
        |turnOff|           // event selector for 'turnOff' event message
            -> $Off         // transition to $Off state
            ^               // return from event handler

##