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