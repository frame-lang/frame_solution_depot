--- https://arduinoplusplus.wordpress.com/2019/07/06/finite-state-machine-programming-basics-part-1/

#Blink

    -interface-

    tick[reset:bool]

    -machine-

    $LedToggle
        |tick|[reset:bool]
            reset ? ->> "reset" $Reset ^ :: 
            digitalWrite(LED_BUILTIN  !digitalRead(LED_BUILTIN))
            #.timeLastTransition = millis()
            ->> $WaitDisplay ^

    $WaitDisplay
        |tick|[reset:bool]
            reset ? ->>  "reset" $Reset ^ :: 
            millis() - timeLastTransition >= LED_DELAY ?
                ->> "timeout" $LedToggle ^
            :: ^
    $Reset 
        |>|
            digitalWrite(LED_BUILTIN LOW)
            ->> $LedToggle ^


    -domain-

    var timeLastTransition:uint32_t = 0

##