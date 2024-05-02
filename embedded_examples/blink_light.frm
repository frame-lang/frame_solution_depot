//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | blink_light.frm
//* Description       | Simple blinking light controller. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-May-02  mark               Created
//*******************************************************************/

// Video: https://arduinoplusplus.wordpress.com/2019/07/06/finite-state-machine-programming-basics-part-1/

#Blink

    -interface-

    tick[reset:bool]

    -machine-

    $LedToggle
        |tick|[reset:bool]
            reset ? -> "reset" $Reset ^ :| 
            digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN))
            #.timeLastTransition = millis()
            -> $LedDelay ^

    $LedDelay
        |tick|[reset:bool]
            reset ? ->  "reset" $Reset ^ :| 
            millis() - timeLastTransition >= LED_DELAY ?
                -> "timeout" $LedToggle ^
            :| ^
    $Reset 
        |>|
            digitalWrite(LED_BUILTIN, LOW)
            -> $LedToggle ^


    -domain-

    var timeLastTransition:uint32_t = 0
    const LED_DELAY:uint32_t = 1000
##