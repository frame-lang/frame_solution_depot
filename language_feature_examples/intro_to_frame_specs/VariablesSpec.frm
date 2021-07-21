#VariablesSpec

    -interface-

    start @(|>>|)
    
    -machine-

    $Start
        |>>| -> $Working ^

    $Working 
        var stateVar:String = "State Variable"

        |>|
            var eventHandlerVar:String 
                        = "Event Handler Variable"

            printVars(#.domainVar 
                      $.stateVar 
                      ||.eventHandlerVar)
                      
            printVars(domainVar 
                      stateVar 
                      eventHandlerVar)
            ^

    -actions-

    printVars[domainVar:String stateVar:String eventHandlerVar:String]

    -domain-

    var domainVar:String = "Domain Variable"
##

