
// https://gameprogrammingpatterns.com/state.html

#Heroine 

    -machine-

    $Standing 
        |>|
            setGraphics(IMAGE_STAND) ^

        |PRESS_B| 
            -> $Jumping ^

        |PRESS_DOWN|  
            -> $Ducking ^

    $Jumping
        |>|
            yVelocity_ = JUMP_VELOCITY
            setGraphics(IMAGE_JUMP) ^

         |PRESS_DOWN|         
            -> $Diving ^ 

    $Diving
        |>|
            setGraphics(IMAGE_DIVE) ^


    $Ducking
        |>|
            chargeTime = 0
            setGraphics(IMAGE_DUCK) ^

        |RELEASE_DOWN|
            -> $Standing ^     

        |update|
            chargeTime = chargeTime + 1
            chargeTime > MAX_CHARGE ? superBomb() :| ^
        
##