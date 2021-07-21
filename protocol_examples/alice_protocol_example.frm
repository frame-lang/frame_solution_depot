#Alice

    -machine-

    $Start 
        |seeBob| 
            -> $GreetBob ^

    $GreetBob 
        |>| 
            post_hiBob() 
            startTimer() ^
        |<| 
            stopTimer() ^
        |timeout| 
            -> $TimeoutError ^
        |hiBob_Ack| 
            -> $WaitForGreeting ^
        |hiBob_Nack| 
            -> $ProtocolError ^

    $WaitForGreeting
        |>| 
            startTimer() ^
        |<| 
            stopTimer() ^
        |timeout| 
            -> $TimeoutError ^
        |hiAlice| 
            -> $FareWellBob ^

    $FareWellBob
        |>| 
            post_goodbyeBob()
            startTimer() ^
        |<| 
            stopTimer() ^
        |timeout| 
            -> $TimeoutError ^
        |goodbyeBob_Ack| 
            -> $WaitForFarewell ^
        |goodbyeBob_Nack| 
            -> $ProtocolError ^

    $WaitForFarewell
        |>| 
            startTimer() ^
        |<| 
            stopTimer() ^
        |timeout| 
            -> $TimeoutError ^
        |goodbyeAlice| 
            -> $End ^
        
    $TimeoutError
        |>| 
            logTimeoutError() 
            -> $End ^

    $ProtocolError
        |>|
            logProtocolError()
                -> $End ^

    $End 

##  