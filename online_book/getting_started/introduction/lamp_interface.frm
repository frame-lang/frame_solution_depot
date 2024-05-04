// https://docs.frame-lang.org/en/latest/getting_started/index.html#the-interface-block

#Lamp

    -interface-

    turnOn      // Interface method that sends 'turnOn' event to the machine
    turnOff     // Interface method that sends 'turnOff' event to the machine

    -machine-

    $Off
        |turnOn|
            -> $On  ^

    $On
        |turnOff|
            -> $Off  ^

##