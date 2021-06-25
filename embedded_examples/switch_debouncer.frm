--- A Frame solution for debouncing a switch controller on 
--- an Arduino. This is based on an excellent YouTube video.

--- see talk video: https://www.youtube.com/watch?v=v8KXa5uRavg
--- see Frame solution: https://framepiler.frame-lang.org/example/aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZnJhbWUtbGFuZy81Y2NlYzRhNjdmOTVlNTlkNDNmNDZkMGFkNjliZTUyZQ==
--- get Frame: http://framepiler.frame-lang.org
--- more Frame solutions: https://github.com/frame-lang/frame_solution_depot


#SwitchDebouncer

    -interface-

    tick

    -machine-

    $Reset 
        |>| 
            print("Enter $Reset") 
            -> "Enter" $Wait ^
        |<| print("Exit $Reset") ^
    
    $Wait
        |tick|
            isLow() ? -> "Is Low" $Arming :: ^

    $Arming
        |>| 
            recordStartTime() 
            -> "record bounce\nstart time" $Armed 
            ^

    $Armed
        |tick|
            isHigh() ? -> "is high" $Reset ^ :>
            isPastBounceDelay() ? -> "past bounce delay"  $Drawn ^ :: ^

    $Drawn
        |tick|
            isHigh() ? -> "is high" $Triggered ^ :>
            isPastHoldDelay() ? -> "past hold delay" $Hold :: ^

    $Triggered
        |>|
            print("Enter Triggered")
            -> "resetting\nimmediately" $Reset ^
        |<| print("Exit $Triggered") ^

    $Hold 
        |>|
            print("enter $Hold")
            -> "goto $LowWait\n immediately" $LowWait ^
        |<| print("Exit $Hold") ^

    $LowWait
        |>| print("Enter $LowWait") ^   
        |<| print("Exit $LowWait") ^  
        |tick| isHigh() ? -> "is high" $Reset :: ^     

##