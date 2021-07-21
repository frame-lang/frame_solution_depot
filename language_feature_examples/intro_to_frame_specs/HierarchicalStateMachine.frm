#HierarchicalStateMachine

    -interface-

    start @(|>>|)
    stop @(|<<|)

    -machine-

    $Begin
        |>>| print("Starting in $Begin")
             -> "start" $Working ^

    $Working => $Default
        |>| print("Enter $Working") ^
        |<| print("Exit $Working") ^

    $End
        |>| print("Enter $End") ^

    $Default
        |<<| print("Stopping handled in $Default")
             -> "stop" $End ^

    -actions-

    print[msg:string]:void

##
