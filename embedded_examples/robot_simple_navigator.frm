#RobotSimpleNavigator

    -interface-

    tick 

    -machine-

    $Stop 
        |tick|
            getSensor() ?~ 
                /SENSOR_RIGHT/ 
                    motors_left()
                    -> "SENSOR_RIGHT" $RotateLeft ^ :>
                /SENSOR_LEFT/
                    motors_right()
                    -> "SENSOR_LEFT" $RotateRight 
                :
                    motors_forward()
                    -> "NONE" $Forward ^
                :: ^

    $Forward

    $RotateRight 

    $RotateLeft 

    -domain-

##

    case STOP:
      if(sensors == NONE){
        motors_forward();
        state = FORWARD;
      }
      else if(sensors == SENSOR_RIGHT){
        motors_left();
        state = ROTATE_LEFT;
      }
      else{
        motors_right();
        state = ROTATE_RIGHT;
      }
      break;
       