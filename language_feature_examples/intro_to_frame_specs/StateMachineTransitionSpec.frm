#StateMachineTransitionSpec

    -interface-

    start
    stop

    -machine-

    $Begin
        |start| 
            print("Starting") 
            -> $Working ^

    $Working
        |>| print("Enter $Working") ^
        |<| print("Exit $Working") ^
        |stop| -> $End ^

    $End

    -actions-

    print[msg:String]

##