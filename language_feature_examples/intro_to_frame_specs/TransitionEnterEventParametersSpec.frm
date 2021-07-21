#TransitionEnterEventParametersSpec

    -interface-

    start[msg:String]

    -machine-

    $Start 
        |start|[msg:String]
            -> (msg) "Pass msg to $Print first" $Print ^

    $Print
        |>|[msg:String] 
            print(msg) ^

    -actions-

    print[msg:String]

##