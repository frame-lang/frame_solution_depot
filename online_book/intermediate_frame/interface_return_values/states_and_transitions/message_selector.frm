// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#message-selector

#MessageSending

    -interface-

    // The "foo" interface method sends the "foo" event message

    foo

    -machine-

    $Working

        // This event handler is triggered when the state
        // recieves a "foo" message.

        |foo| print("handled foo") ^

##