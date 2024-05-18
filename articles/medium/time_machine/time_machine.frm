

#TimeMachine

    -machine-

    $Start
        |>|
            log("$Delaying |>|")
            showDelayMessage()
            initCounter()
            startTimer() ^
        |timeout|
            log("$Delaying |timeout|")
            decrementCounter()
            isCounterAt0() ? -> $Ready :| ^
        |<|
            stopTimer() 
            log("$Delaying |<|") ^   

##